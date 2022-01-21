Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19A4967A9
	for <lists+linux-cachefs@lfdr.de>; Fri, 21 Jan 2022 22:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642802276;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QUM5pVDdzbZ6c7CdmOTC5Dng7adQPEpTxR1RPY9S2fE=;
	b=SAJxvKZqt4LIqsQ81jotEwMWHvo+DidZmUnneIIyNeEtic0uuGy/X2X0lYlT3+F7jKdHYY
	kP6+wtzS2DF7rC79pZwTxZzX6H/MTfy2Fr3c5yXrRmBrIh8oi47W6zRaBD9MXWfSM+v/Mw
	QeMQ5/pMtTDOruDuX9ZjW+bdkckCRjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-NjcvU2IcNyeZ1jmebac1Qw-1; Fri, 21 Jan 2022 16:57:52 -0500
X-MC-Unique: NjcvU2IcNyeZ1jmebac1Qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F1E581F002;
	Fri, 21 Jan 2022 21:57:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7722246988;
	Fri, 21 Jan 2022 21:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C7B74BB7C;
	Fri, 21 Jan 2022 21:57:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20LLvdCk023866 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 16:57:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67DFB12E24; Fri, 21 Jan 2022 21:57:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A28712E1C;
	Fri, 21 Jan 2022 21:57:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Fri, 21 Jan 2022 21:57:24 +0000
Message-ID: <1339462.1642802244@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20LLvdCk023866
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [GIT PULL] fscache: Fixes and minor updates for
	rewrite
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1339461.1642802244.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull this set of fixes and minor updates for the fscache
rewrite[1] please?

 (1) Fix mishandling of volume collisions (the wait condition is inverted
     and so it was only waiting if the volume collision was already
     resolved).

 (2) Fix miscalculation of whether there's space available in cachefiles.

 (3) Make sure a default cache name is set on a cache if the user hasn't
     set one by the time they bind the cache.

 (4) Adjust the way the backing inode is presented in tracepoints, add a
     tracepoint for mkdir and trace directory lookup.

 (5) Add a tracepoint for failure to set the active file mark.

 (6) Add an explanation of the checks made on the backing filesystem.

 (7) Check that the backing filesystem supports tmpfile.

 (8) Document how the page-release cancellation of the read-skip
     optimisation works.

And I've included a change for netfslib:

 (9) Make ops->init_rreq() optional.

Note that I dropped the patch that I had to add IS_KERNEL_FILE() as the
naming of S_KERNEL_FILE is undergoing late discussion[2] and I dropped the
patch to rewrite cifs's fscache indexing as SteveF has taken that into his
tree.

Thanks,
David


Link: https://lore.kernel.org/r/510611.1641942444@warthog.procyon.org.uk/ [1]
Link: https://lore.kernel.org/r/CAOQ4uxjEcvffv=rNXS-r+NLz+=6yk4abRuX_AMq9v-M4nf_PtA@mail.gmail.com/ [2]
Link: https://lore.kernel.org/r/164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk/ # v1
---
The following changes since commit 455e73a07f6e288b0061dfcf4fcf54fa9fe06458:

  Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux (2022-01-12 17:02:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/fscache-fixes-20220121

for you to fetch changes up to cef0223191452b3c493a1070baad9ffe806babac:

  netfs: Make ops->init_rreq() optional (2022-01-21 21:36:28 +0000)

----------------------------------------------------------------
fscache fixes

----------------------------------------------------------------
David Howells (7):
      fscache: Fix the volume collision wait condition
      cachefiles: Calculate the blockshift in terms of bytes, not pages
      cachefiles: Make some tracepoint adjustments
      cachefiles: Trace active-mark failure
      cachefiles: Explain checks in a comment
      cachefiles: Check that the backing filesystem supports tmpfiles
      fscache: Add a comment explaining how page-release optimisation works

Jeffle Xu (2):
      cachefiles: set default tag name if it's unspecified
      netfs: Make ops->init_rreq() optional

 fs/cachefiles/cache.c             |  17 ++++---
 fs/cachefiles/daemon.c            |  11 ++++
 fs/cachefiles/internal.h          |   2 +-
 fs/cachefiles/io.c                |   2 +-
 fs/cachefiles/namei.c             |  12 +++--
 fs/ceph/addr.c                    |   5 --
 fs/fscache/volume.c               |   4 +-
 fs/netfs/read_helper.c            |   3 +-
 include/linux/fscache.h           |   5 ++
 include/trace/events/cachefiles.h | 103 ++++++++++++++++++++++++++------------
 10 files changed, 113 insertions(+), 51 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

