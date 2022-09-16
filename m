Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B65BB152
	for <lists+linux-cachefs@lfdr.de>; Fri, 16 Sep 2022 18:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663347245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pjxg7A6ArpGRmdcSnU0iE3OcK5eQEzzP2sj0G2sf+3I=;
	b=WNr2HzReFkzYwgt0MvC8YjMbSWqvhjq/wHI1G6+XmzFWSj3ZZL3SZFN3+f/l6heAnBg9k8
	rL5wroIksyBWqILM3LvFBC8kmYFRnO5QucVPdrJhlbIR4r/SCeOnYOnD4/aYwkx1WCf0i9
	FdhlMaiEDmwsMFXOnUqkFHwyaV3aglg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-6h3S9sjbMH27bL76dv5ydA-1; Fri, 16 Sep 2022 12:54:02 -0400
X-MC-Unique: 6h3S9sjbMH27bL76dv5ydA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 782D785A59D;
	Fri, 16 Sep 2022 16:54:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88FC7492CA4;
	Fri, 16 Sep 2022 16:53:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CADA81946595;
	Fri, 16 Sep 2022 16:53:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 87DF01946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 16 Sep 2022 16:53:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67F3340C6EC3; Fri, 16 Sep 2022 16:53:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.8.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD91B40C6EC2;
 Fri, 16 Sep 2022 16:53:53 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Date: Fri, 16 Sep 2022 12:53:49 -0400
Message-Id: <20220916165352.885955-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH v7 0/3] Convert NFS with fscache to the
 netfs API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patchset converts NFS with fscache non-direct READ IO paths to
use the netfs API with a non-invasive approach.  The existing NFS pgio
layer does not need extensive changes, and is the best way so far I've
found to address Trond's concerns about modifying the IO path [1] as
well as only enabling netfs when fscache is configured and enabled [2].
I have not attempted performance comparisions to address Chuck
Lever's concern [3] because we are not converting the non-fscache
enabled NFS IO paths to netfs.

The main patch to be reviewed is patch #3 which converts nfs_read_folio
and nfs_readahead.

The patchset is based on 6.0-rc5 and has been pushed to github at:
https://github.com/DaveWysochanskiRH/kernel/commits/nfs-fscache-netfs
https://github.com/DaveWysochanskiRH/kernel/commit/7d57f6484951800de518f555a04a3a4dc4a1327c


Changes since v6
================
PATCH3: Fix generic/127 "Subreq overread" by calling netfs_subreq_terminated()
with a length capped by sreq->len.  This is related to the following patch which
may cause us to read a full page even if the i_size does not extend to the end of
the page:
8cfb9015280d NFS: Always provide aligned buffers to the RPC read layers

Testing
=======
The patches are fairly stable as evidenced with xfstests generic with
various servers, both with and without fscache enabled, with no hangs
or crashes seen: 
hammerspace(pNFS flexfiles): NFS4.1, NFS4.2
NetApp(pNFS filelayout): NFS3, NFS4.0, NFS4.1
RHEL8: NFS3,NFS4.1,NFS4.2

The known issues are as follows:

1. Unit test setting rsize < readahead does not properly read from
fscache but re-reads data from the NFS server
* This will be fixed with another linux-cachefs [4] patch to resolve
"Stop read optimisation when folio removed from pagecache"
* Daire Byrne also verified the patch fixes his issue as well

2. "Cache volume key already in use" after xfstest runs
* xfstests (hammerspace with vers=4.2,fsc) shows the following on the
console after some tests:
"NFS: Cache volume key already in use (nfs,4.1,2,c50,cfe0100a,3,,,8000,100000,100000,bb8,ea60,7530,ea60,1)"
* This may be fixed with another patch [5] that is in progress

3. Daire Byrne reported a NULL pointer oops at cachefiles_prepare_write+0x28/0x90
* may be a bug in netfs or cachefiles exposed by NFS patches
* under investigation

[58710.346376] BUG: kernel NULL pointer dereference, address: 0000000000000008
[58710.371212] CPU: 12 PID: 9134 Comm: kworker/u129:0 Tainted: G E      6.0.0-2.dneg.x86_64 #1
...
[58710.389995] Workqueue: events_unbound netfs_rreq_write_to_cache_work [netfs]
[58710.397188] RIP: 0010:cachefiles_prepare_write+0x28/0x90 [cachefiles]
...
[58710.500316] Call Trace:
[58710.502894]  <TASK>
[58710.505126]  netfs_rreq_write_to_cache_work+0x11c/0x320 [netfs]
[58710.511201]  process_one_work+0x217/0x3e0
[58710.515358]  worker_thread+0x4a/0x3b0
[58710.519152]  ? process_one_work+0x3e0/0x3e0
[58710.523467]  kthread+0xd6/0x100
[58710.526740]  ? kthread_complete_and_exit+0x20/0x20
[58710.531659]  ret_from_fork+0x1f/0x30



Outstanding
===========
Note that the existing NFS fscache stats ("fsc:" line in /proc/self/mountstats)
as well as trace events still need removed.  I've left these out of
this patchset for now as removing them are benign and can come later
(the stats will all be 0, and trace events are no longer used).
The existing NFS fscache stat counts no longer apply since the new
API is not page based - they are not meaningful or possible to obtain,
and there are new fscache stats in /proc/fs/fscache/stats.  A similar
situation exists with the NFS trace events - netfs and fscache have
plenty of trace events so the NFS specific ones probably are not needed.

References
==========
[1] https://lore.kernel.org/linux-nfs/9cfd5bc3cfc6abc2d3316b0387222e708d67f595.camel@hammerspace.com/
[2] https://lore.kernel.org/linux-nfs/da9200f1bded9b8b078a7aef227fd6b92eb028fb.camel@hammerspace.com/
[3] https://marc.info/?l=linux-nfs&m=160597917525083&w=4
[4] https://www.mail-archive.com/linux-cachefs@redhat.com/msg03043.html
[5] https://marc.info/?l=linux-nfs&m=165962662200679&w=4

Dave Wysochanski (3):
  NFS: Rename readpage_async_filler to nfs_pageio_add_page
  NFS: Configure support for netfs when NFS fscache is configured
  NFS: Convert buffered read paths to use netfs when fscache is enabled

 fs/nfs/Kconfig           |   1 +
 fs/nfs/delegation.c      |   2 +-
 fs/nfs/dir.c             |   2 +-
 fs/nfs/fscache.c         | 251 +++++++++++++++++++++++----------------
 fs/nfs/fscache.h         | 113 ++++++++++++------
 fs/nfs/inode.c           |   8 +-
 fs/nfs/internal.h        |  11 +-
 fs/nfs/pagelist.c        |  12 ++
 fs/nfs/pnfs.c            |  12 +-
 fs/nfs/read.c            | 111 +++++++++--------
 fs/nfs/write.c           |   2 +-
 include/linux/nfs_fs.h   |  34 ++++--
 include/linux/nfs_page.h |   3 +
 include/linux/nfs_xdr.h  |   3 +
 14 files changed, 347 insertions(+), 218 deletions(-)

-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

