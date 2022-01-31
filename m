Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FADA4A49EA
	for <lists+linux-cachefs@lfdr.de>; Mon, 31 Jan 2022 16:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643641984;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oGg5ExoPYSiBpVnNeHlr973Uaz1l5rXSsu6MCqNqAPc=;
	b=go/8qvuFjbBH/0HwviTQt4gBR0P10QR/IoxyowuApHrgCahd6Hit2UNxtfY72lqHf7kTYP
	RDx9s2EZ+aeRoNgFaisKH3hPTkD9fUJpCVAItSpbal2XI7nMzpabAMxPcfcDYImlUoOtWh
	4cMHYdWpul6d5ke2IZorS0VFTWY35iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-hCIeec_TPEm9vuVLfxDT_w-1; Mon, 31 Jan 2022 10:13:00 -0500
X-MC-Unique: hCIeec_TPEm9vuVLfxDT_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF5A58519E1;
	Mon, 31 Jan 2022 15:12:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 910C270D33;
	Mon, 31 Jan 2022 15:12:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7340E4BB7C;
	Mon, 31 Jan 2022 15:12:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20VFCp4h006899 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 31 Jan 2022 10:12:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 333377DE24; Mon, 31 Jan 2022 15:12:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12BF47DE26;
	Mon, 31 Jan 2022 15:12:44 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 31 Jan 2022 15:12:44 +0000
Message-ID: <164364196407.1476539.8450117784231043601.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-unionfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org
Subject: [Linux-cachefs] [RFC][PATCH 0/5] vfs, overlayfs,
 cachefiles: Combine I_OVL_INUSE and S_KERNEL_FILE and split out
 no-remove
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Amir,

How about this as a set of patches to do what you suggest[1] and hoist the
handler functions for I_OVL_INUSE into common code and rename the flag to
I_EXCL_INUSE.  This can then be shared with cachefiles - allowing me to get
rid of S_KERNEL_FILE.

I did split out the functionality for preventing file/dir removal to a
separate flag, I_NO_REMOVE, so that it's not tied to I_EXCL_INUSE in case
overlayfs doesn't want to use it.  The downside to that, though is that it
requires a separate locking of i_lock to set/clear it.

I also added four general tracepoints to log successful lock/unlock,
failure to lock and a bad unlock.  The lock tracepoints log which driver
asked for the lock and all tracepoints allow the driver to log an arbitrary
reference number (in cachefiles's case this is the object debug ID).

Questions:

 (1) Should it be using a flag in i_state or a flag in i_flags?  I'm not
     sure what the difference is really.

 (2) Do we really need to take i_lock when testing I_EXCL_INUSE?  Would
     READ_ONCE() suffice?


The patches are on a branch here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-fixes

David

Link: https://lore.kernel.org/r/CAOQ4uxhRS3MGEnCUDcsB1RL0d1Oy0g0Rzm75hVFAJw2dJ7uKSA@mail.gmail.com/ [1]

---
David Howells (5):
      vfs, overlayfs, cachefiles: Turn I_OVL_INUSE into something generic
      vfs: Add tracepoints for inode_excl_inuse_trylock/unlock
      cachefiles: Split removal-prevention from S_KERNEL_FILE and extend effects
      cachefiles: Use I_EXCL_INUSE instead of S_KERNEL_FILE
      cachefiles: Remove the now-unused mark-inode-in-use tracepoints


 fs/cachefiles/namei.c             | 54 +++++++++++++-------------
 fs/inode.c                        | 56 +++++++++++++++++++++++++++
 fs/namei.c                        |  8 ++--
 fs/overlayfs/overlayfs.h          |  3 --
 fs/overlayfs/super.c              | 14 ++++---
 fs/overlayfs/util.c               | 43 ---------------------
 include/linux/fs.h                | 33 ++++++++++++++--
 include/trace/events/cachefiles.h | 63 -------------------------------
 8 files changed, 126 insertions(+), 148 deletions(-)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

