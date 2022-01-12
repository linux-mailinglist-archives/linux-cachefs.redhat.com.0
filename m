Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6D48BEEE
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Jan 2022 08:20:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641972058;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=myL7/azn2zIMvAImYmQX0iYkyZdr/xfZPDp70oyEkBU=;
	b=eb+D1RXxkf04eGyddaq9TScK1leNbDD+pZ2SMdszl4WwucriWZe6Q809gpUB3obe1WRVeP
	MnapI0HwVhQozkLCC1pCWSIKsgXQtx2CfPu5cosWbySA83FqitqYrFderO1iUxInEDO3Fk
	k3+tOwrxGUFm0n5NY2SlyoPQLIsQso4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-kMjCP4aOPqKYHt9Th1o-aw-1; Wed, 12 Jan 2022 02:20:55 -0500
X-MC-Unique: kMjCP4aOPqKYHt9Th1o-aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499FA81EE60;
	Wed, 12 Jan 2022 07:20:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04427163C7;
	Wed, 12 Jan 2022 07:20:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AF7C1809CB8;
	Wed, 12 Jan 2022 07:20:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20C7KmRU010481 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 02:20:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 136507B03C; Wed, 12 Jan 2022 07:20:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 914407B9D2;
	Wed, 12 Jan 2022 07:20:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <3462849.1641593783@warthog.procyon.org.uk>
References: <3462849.1641593783@warthog.procyon.org.uk>
	<164021579335.640689.2681324337038770579.stgit@warthog.procyon.org.uk>
	<164021479106.640689.17404516570194656552.stgit@warthog.procyon.org.uk>
To: Steve French <smfrench@gmail.com>
MIME-Version: 1.0
Date: Wed, 12 Jan 2022 07:20:40 +0000
Message-ID: <534840.1641972040@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20C7KmRU010481
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH v5 63/68] cifs: Support fscache indexing
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <534839.1641972040.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Steve,

I think this needs the further changes below, which I will fold in.  The
issues are:

 (1) One of the error paths in cifs_atomic_open() uses the cookie when it
     should jump around that.

 (2) There's an additional successful return from the middle of cifs_open()
     that I mistook for an error path, but does need to use the cookie on
     the way out.

David
---
diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
index 6186824b366e..bf3b4c9901b9 100644
--- a/fs/cifs/dir.c
+++ b/fs/cifs/dir.c
@@ -508,6 +508,7 @@ cifs_atomic_open(struct inode *inode, struct dentry *direntry,
 			server->ops->close(xid, tcon, &fid);
 		cifs_del_pending_open(&open);
 		rc = -ENOMEM;
+		goto out;
 	}
 
 	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 44da7646f789..47333730c963 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -568,7 +568,7 @@ int cifs_open(struct inode *inode, struct file *file)
 			spin_lock(&CIFS_I(inode)->deferred_lock);
 			cifs_del_deferred_close(cfile);
 			spin_unlock(&CIFS_I(inode)->deferred_lock);
-			goto out;
+			goto use_cache;
 		} else {
 			_cifsFileInfo_put(cfile, true, false);
 		}
@@ -630,19 +630,6 @@ int cifs_open(struct inode *inode, struct file *file)
 		goto out;
 	}
 
-
-	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
-			   file->f_mode & FMODE_WRITE);
-	if (file->f_flags & O_DIRECT &&
-	    (!((file->f_flags & O_ACCMODE) != O_RDONLY) ||
-	     file->f_flags & O_APPEND)) {
-		struct cifs_fscache_inode_coherency_data cd;
-		cifs_fscache_fill_coherency(file_inode(file), &cd);
-		fscache_invalidate(cifs_inode_cookie(file_inode(file)),
-				   &cd, i_size_read(file_inode(file)),
-				   FSCACHE_INVAL_DIO_WRITE);
-	}
-
 	if ((oplock & CIFS_CREATE_ACTION) && !posix_open_ok && tcon->unix_ext) {
 		/*
 		 * Time to set mode which we can not set earlier due to
@@ -661,6 +648,19 @@ int cifs_open(struct inode *inode, struct file *file)
 				       cfile->pid);
 	}
 
+use_cache:
+	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
+			   file->f_mode & FMODE_WRITE);
+	if (file->f_flags & O_DIRECT &&
+	    (!((file->f_flags & O_ACCMODE) != O_RDONLY) ||
+	     file->f_flags & O_APPEND)) {
+		struct cifs_fscache_inode_coherency_data cd;
+		cifs_fscache_fill_coherency(file_inode(file), &cd);
+		fscache_invalidate(cifs_inode_cookie(file_inode(file)),
+				   &cd, i_size_read(file_inode(file)),
+				   FSCACHE_INVAL_DIO_WRITE);
+	}
+
 out:
 	free_dentry_path(page);
 	free_xid(xid);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

