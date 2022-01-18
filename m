Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 632684927A5
	for <lists+linux-cachefs@lfdr.de>; Tue, 18 Jan 2022 14:55:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642514099;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cv2RlpORbnRazbL/UfZKJ/RrTPUoMNWFx2SyTnBMqPk=;
	b=SiM720KANcjn9pQgHRr+VOsexNMt4+S58roMhw6H1xE3YEaf9u+cWoi98Q7rVFRkk2P5f3
	e++S6bdDOsh3AZZIEi5riEa/N/KcxkVsjDLvCyiBQSQLXkCVGspLPlzNzr3zjcGIkL7kJZ
	H7HeN1RH3I1oJF85ZYtacRcDhEw/+K8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-gEHbyh45OmCT8Bbd2WWRGA-1; Tue, 18 Jan 2022 08:54:56 -0500
X-MC-Unique: gEHbyh45OmCT8Bbd2WWRGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046F68F514;
	Tue, 18 Jan 2022 13:54:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E83E18462D;
	Tue, 18 Jan 2022 13:54:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8997E1806D03;
	Tue, 18 Jan 2022 13:54:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IDsdCY014141 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 08:54:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A7627E12B; Tue, 18 Jan 2022 13:54:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD9D7E2EA;
	Tue, 18 Jan 2022 13:54:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Tue, 18 Jan 2022 13:54:25 +0000
Message-ID: <164251406558.3435901.1249023136670058162.stgit@warthog.procyon.org.uk>
In-Reply-To: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
References: <164251396932.3435901.344517748027321142.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <smfrench@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: [Linux-cachefs] [PATCH 07/11] cachefiles: Check that the backing
 filesystem supports tmpfiles
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a check that the backing filesystem supports the creation of
tmpfiles[1].

Suggested-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/568749bd7cc02908ecf6f3d6a611b6f9cf5c4afd.camel@kernel.org/ [1]
---

 fs/cachefiles/cache.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
index 2b2879c5d1d2..7077f72e6f47 100644
--- a/fs/cachefiles/cache.c
+++ b/fs/cachefiles/cache.c
@@ -51,6 +51,7 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
 
 	/* Check features of the backing filesystem:
 	 * - Directories must support looking up and directory creation
+	 * - We create tmpfiles to handle invalidation
 	 * - We use xattrs to store metadata
 	 * - We need to be able to query the amount of space available
 	 * - We want to be able to sync the filesystem when stopping the cache
@@ -60,6 +61,7 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
 	if (d_is_negative(root) ||
 	    !d_backing_inode(root)->i_op->lookup ||
 	    !d_backing_inode(root)->i_op->mkdir ||
+	    !d_backing_inode(root)->i_op->tmpfile ||
 	    !(d_backing_inode(root)->i_opflags & IOP_XATTR) ||
 	    !root->d_sb->s_op->statfs ||
 	    !root->d_sb->s_op->sync_fs ||


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

