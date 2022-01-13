Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86148DB99
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 17:20:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642090846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s1QUU+qbgbEBXJ/NeWSAR38KptvE02gOidF6sicsVlE=;
	b=a9oY3pAc0dfg1R0BQCMlc9t3ocU6jXraUPgtn2+V+HXIXucwDdHZAIPpRpMiChaCMCSCYN
	GsWGTc7Q8zM4ywyUBn0XcuVIxbi6Wgw4TInNXPiLLdLlQIBPuuf8E3kIB89J3e7cxfZjN8
	KMcVq2ptR2s/pUVztl0m2mzyydwP/9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-2YP2l0OLPfiE6FAp-r2wsw-1; Thu, 13 Jan 2022 11:20:45 -0500
X-MC-Unique: 2YP2l0OLPfiE6FAp-r2wsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D922C835E21;
	Thu, 13 Jan 2022 16:20:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44158798A5;
	Thu, 13 Jan 2022 16:20:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FD024BB7B;
	Thu, 13 Jan 2022 16:20:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20DGKWPA029504 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 11:20:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B561A7D3D4; Thu, 13 Jan 2022 16:20:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FC447D3D2;
	Thu, 13 Jan 2022 16:20:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1318953.1642024578@warthog.procyon.org.uk>
References: <1318953.1642024578@warthog.procyon.org.uk>
	<164021579335.640689.2681324337038770579.stgit@warthog.procyon.org.uk>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
To: Steve French <smfrench@gmail.com>
MIME-Version: 1.0
Date: Thu, 13 Jan 2022 16:20:29 +0000
Message-ID: <1886510.1642090829@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, Murphy Zhou <jencce.kernel@gmail.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6] cifs: Support fscache indexing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1886509.1642090829.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> -	/*
> -	 * The cookie is initialized from volume info returned above.
> -	 * Inside cifs_fscache_get_super_cookie it checks
> -	 * that we do not get super cookie twice.
> -	 */
> -	cifs_fscache_get_super_cookie(tcon);
> +	if (!rc &&
> +	    (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_FSCACHE)) {
> +		/*
> +		 * The cookie is initialized from volume info returned above.
> +		 * Inside cifs_fscache_get_super_cookie it checks
> +		 * that we do not get super cookie twice.
> +		 */
> +		rc = cifs_fscache_get_super_cookie(tcon);
> +		if (rc < 0) {
> +			iget_failed(inode);
> +			inode = ERR_PTR(rc);
> +		}
> +	}

This bit should've been removed - and the bit it is modifying was removed by
commit b774302e885697dde027825f8de9beb985d037bd which is now upstream.

The invocation of cifs_fscache_get_super_cookie() added by that commit should
be altered to make it conditional.

To this end, I've rebased the patch on linus/master and something
approximating the attached change needs to be made.

David
---
diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index f977e02bd21e..598be9890f2a 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3057,7 +3057,8 @@ static int mount_get_conns(struct mount_ctx *mnt_ctx)
 	 * Inside cifs_fscache_get_super_cookie it checks
 	 * that we do not get super cookie twice.
 	 */
-	cifs_fscache_get_super_cookie(tcon);
+	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_FSCACHE)
+		cifs_fscache_get_super_cookie(tcon);
 
 out:
 	mnt_ctx->server = server;
diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index 3c3bc28090d8..9b93e7d3e0e1 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -1368,20 +1368,6 @@ struct inode *cifs_root_iget(struct super_block *sb)
 		inode = ERR_PTR(rc);
 	}
 
-	if (!rc &&
-	    (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_FSCACHE)) {
-		/*
-		 * The cookie is initialized from volume info returned above.
-		 * Inside cifs_fscache_get_super_cookie it checks
-		 * that we do not get super cookie twice.
-		 */
-		rc = cifs_fscache_get_super_cookie(tcon);
-		if (rc < 0) {
-			iget_failed(inode);
-			inode = ERR_PTR(rc);
-		}
-	}
-
 out:
 	kfree(path);
 	free_xid(xid);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

