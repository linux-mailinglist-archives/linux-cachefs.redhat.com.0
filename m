Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BAA092CD89C
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 15:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607004709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k0pT0uVdzAeUHJ/e5H7amyvAFxEFtxtGxH56Wvkhm/8=;
	b=Vhc+gX/phJR6Q1H5qdWtcbej0Xok8pk/nvInLn7LARl00CkeUaaMzUrekRo1nNEjEWIfT6
	REIfSUMv16V2etSF4uU2LEZWoYtqI0MJiOeEkWAKXRKI1sGg0VsSV7HYazJrHHYuzkqqlf
	2/ocfmAbYtufH6vloqU6g0Cp7fyZ+ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-FHol592aPpaB33V0C7YUAg-1; Thu, 03 Dec 2020 09:11:48 -0500
X-MC-Unique: FHol592aPpaB33V0C7YUAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A335288CE2D;
	Thu,  3 Dec 2020 14:11:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C869D70C43;
	Thu,  3 Dec 2020 14:11:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2594D5002C;
	Thu,  3 Dec 2020 14:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3EBOeM016026 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 09:11:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 35C235DA34; Thu,  3 Dec 2020 14:11:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com
	[10.10.112.159])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 826085DA30;
	Thu,  3 Dec 2020 14:10:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 14:10:56 +0000
Message-ID: <914680.1607004656@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3EBOeM016026
X-loop: linux-cachefs@redhat.com
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-cachefs@redhat.com,
	dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] Problems doing DIO to netfs cache on XFS from Ceph
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <914679.1607004656.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Christoph,

We're having a problem making the fscache/cachefiles rewrite work with XFS, if
you could have a look?  Jeff Layton just tripped the attached warning from
this:

	/*
	 * Given that we do not allow direct reclaim to call us, we should
	 * never be called in a recursive filesystem reclaim context.
	 */
	if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
		goto redirty;

The chain of events is the following:

 (1) Ceph is asked to do an ordinary write by userspace.  It calls the fscache
     netfs_write_begin() helper to read the region it's going to modify so
     that the cache can be preloaded.

 (2) In this case, the cache already has it, so cachefiles_read() dispatches
     an async DIO read to the backing filesystem (in this case XFS).

 (3) iomap, on behalf of XFS, flushes the pagecache attached to the backing
     inode, which appears to be populated, causing do_writepages() to run.

 (4) The XFS write-out eventually wends its way to iomap_do_writepage(), which
     complains about NOFS being set and cancels the write.

Now, I'm doing:

	old_nofs = memalloc_nofs_save();
	ret = call_read_iter(file, &ki->iocb, iter);
	memalloc_nofs_restore(old_nofs);

in cachefiles_read() to prevent the cache causing writeout in the netfs to
occur.  Possibly overriding NOFS here is overkill and is only really necessary
in cachefiles_write() - which can be called from netfs writeback.
cachefiles_read() should only be called from netfs ->readpage(), ->readahead()
and ->write_begin() and maybe a workqueue in the case that the cache returns a
short read.

Note that I'm only doing async DIO reads and writes, so I was a bit surprised
that XFS is doing a writeback at all - but I guess that IOCB_DIRECT is
actually just a hint and the filesystem can turn it into buffered I/O if it
wants.

Thanks,
David
---
 WARNING: CPU: 6 PID: 7412 at fs/iomap/buffered-io.c:1465 iomap_do_writepage+0x76a/0x8b0
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-1.fc33 04/01/2014
 RIP: 0010:iomap_do_writepage+0x76a/0x8b0
 Code: 89 f5 41 89 c7 48 83 7d 48 00 0f 85 6e fb ff ff 48 8b 44 24 48 48 8d 5c 24 48 48 39 d8 0f 84 5b fb ff ff 0f 0b e9 54 fb ff ff <0f> 0b e9 76 ff ff ff 0f 0b e9 64 fb ff ff 0f 0b e9 9a fb ff ff 0f
 RSP: 0018:ffffb19b4155f6e0 EFLAGS: 00010206
 RAX: 0000000000440100 RBX: ffffb19b4155f7a8 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: ffffb19b4155f940 RDI: ffffd1e484446740
 RBP: ffffb19b4155f868 R08: ffffffffffffffff R09: 0000000000030360
 R10: 0000000000000002 R11: 0000000000000006 R12: ffff8a5108ad4d30
 R13: 0000000000002a9a R14: ffffb19b4155f7b0 R15: ffffd1e484446740
 FS:  00007f6ff479d740(0000) GS:ffff8a542fb80000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000fc02a8 CR3: 000000013b218000 CR4: 00000000003506e0
 Call Trace:
  ? page_referenced_one+0x150/0x150
  ? __mod_memcg_lruvec_state+0x21/0xe0
  ? clear_page_dirty_for_io+0xf1/0x240
  write_cache_pages+0x186/0x3d0
  ? iomap_readahead+0x1b0/0x1b0
  ? blk_mq_submit_bio+0x2ee/0x4f0
  ? elv_rb_del+0x1f/0x30
  ? deadline_remove_request+0x55/0xb0
  ? dd_dispatch_request+0x151/0x210
  iomap_writepages+0x1c/0x40
  xfs_vm_writepages+0x56/0x70 [xfs]
  do_writepages+0x28/0xa0
  ? xfs_iunlock+0xa3/0xe0 [xfs]
  ? wbc_attach_and_unlock_inode+0xb5/0x140
  __filemap_fdatawrite_range+0xa7/0xe0
  filemap_write_and_wait_range+0x3d/0x90
  __iomap_dio_rw+0x149/0x490
  iomap_dio_rw+0xe/0x30
  xfs_file_dio_aio_read+0xb9/0x100 [xfs]
  xfs_file_read_iter+0xba/0xd0 [xfs]
  cachefiles_read+0x1ee/0x3f0 [cachefiles]
  ? netfs_subreq_terminated+0x240/0x240 [netfs]
  netfs_read_from_cache+0x70/0x80 [netfs]
  netfs_rreq_submit_slice+0x169/0x310 [netfs]
  netfs_write_begin+0x4e4/0x6a0 [netfs]
  ? ceph_put_fmode+0x43/0xd0 [ceph]
  ceph_write_begin+0x141/0x250 [ceph]
  generic_perform_write+0xaf/0x190
  ceph_write_iter+0xab6/0xc90 [ceph]
  ? _cond_resched+0x16/0x40
  ? __ceph_setattr+0x895/0x960 [ceph]
  ? new_sync_write+0x108/0x180
  new_sync_write+0x108/0x180
  vfs_write+0x1bc/0x270
  ksys_write+0x4f/0xc0
  do_syscall_64+0x33/0x40
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

