Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5755F46C6C7
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 22:35:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638912940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rXKnfaqFxZPRqKRKSf5nhxt/DGlhQDIbgmidtScjNzQ=;
	b=KweY10Bv8bJ5vdpuuJ2SakGRHRi9WOMNxXT4rq+krZoXfQSDk3Vceugpd8uXLBszYRirL9
	w8H6E46QVZfvtYIVtT7RySgPwnWDfPgSTSMlH2FZCT3eim4QMKYMzkDoiyt95NDlrboH57
	CmesK3MFWxoFne6k1Fi/35uGam/W9M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-wYCNJ-T4OEmaDkyAJQqA0A-1; Tue, 07 Dec 2021 16:35:37 -0500
X-MC-Unique: wYCNJ-T4OEmaDkyAJQqA0A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E4161023F4E;
	Tue,  7 Dec 2021 21:35:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 356411000051;
	Tue,  7 Dec 2021 21:35:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 521091806D1C;
	Tue,  7 Dec 2021 21:35:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B7LZQXf009336 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Dec 2021 16:35:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E36921972E; Tue,  7 Dec 2021 21:35:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38627196F8;
	Tue,  7 Dec 2021 21:35:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org
MIME-Version: 1.0
Date: Tue, 07 Dec 2021 21:35:05 +0000
Message-ID: <2420479.1638912905@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B7LZQXf009336
X-loop: linux-cachefs@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	jlayton@kernel.org, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [GIT PULL] netfs: Potential deadlock and error
	handling fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2420478.1638912905.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Linus,

Could you pull these fixes for the netfs lib?  There are two:

 (1) Fix a lockdep warning and potential deadlock.  This is takes the
     simple approach of offloading the write-to-cache done from within a
     network filesystem read to a worker thread to avoid taking the
     sb_writer lock from the cache backing filesystem whilst holding the
     mmap lock on an inode from the network filesystem.

     Jan Kara posits a scenario whereby this can cause deadlock[1], though
     it's quite complex and I think requires someone in userspace to
     actually do I/O on the cache files.  Matthew Wilcox isn't so certain,
     though[2].

     An alternative way to fix this, suggested by Darrick Wong, might be to
     allow cachefiles to prevent userspace from performing I/O upon the
     file - something like an exclusive open - but that's beyond the scope
     of a fix here if we do want to make such a facility in the future.

 (2) In some of the error handling paths where netfs_ops->cleanup() is
     called, the arguments are transposed[3].  gcc doesn't complain because
     one of the parameters is void* and one of the values is void*.

David

Link: https://lore.kernel.org/r/20210922110420.GA21576@quack2.suse.cz/ [1]
Link: https://lore.kernel.org/r/Ya9eDiFCE2fO7K/S@casper.infradead.org/ [2]
Link: https://lore.kernel.org/r/20211207031449.100510-1-jefflexu@linux.alibaba.com/ [3]

---
The following changes since commit 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1:

  Linux 5.16-rc4 (2021-12-05 14:08:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git tags/netfs-fixes-20211207

for you to fetch changes up to 3cfef1b612e15a0c2f5b1c9d3f3f31ad72d56fcd:

  netfs: fix parameter of cleanup() (2021-12-07 15:47:09 +0000)

----------------------------------------------------------------
netfslib fixes

----------------------------------------------------------------
David Howells (1):
      netfs: Fix lockdep warning from taking sb_writers whilst holding mmap_lock

Jeffle Xu (1):
      netfs: fix parameter of cleanup()

 fs/netfs/read_helper.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

