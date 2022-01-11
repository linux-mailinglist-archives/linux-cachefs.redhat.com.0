Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D8648BA9D
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Jan 2022 23:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641939458;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0UNKehHmCpKjpfsMlfm1Lkq8XxZeJqSc8VmQxcbqFYQ=;
	b=AbIEpykYhbcqt0MtAorJLMX2sLD6GyG6vV2IjfRLFJjR76lvz9XMF7bEU6GULgdmEHIgbQ
	j4qAuGb2lhdqzgqfYv3ptRh1a+YS3vzSrgCTzDB462A8Q8sQsSKGimJrp+F6vpWmJoxd75
	PBA4bW5s45MlC1wdoCtu8vVVbr+YRz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-AiTJNFDpNZKyNNZBA9CM6g-1; Tue, 11 Jan 2022 17:17:35 -0500
X-MC-Unique: AiTJNFDpNZKyNNZBA9CM6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C25D2F24;
	Tue, 11 Jan 2022 22:17:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A48CBE726;
	Tue, 11 Jan 2022 22:17:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E56D4A7C8;
	Tue, 11 Jan 2022 22:17:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BMHOQ5003570 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 17:17:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF2BC103BAAF; Tue, 11 Jan 2022 22:17:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75F72104253A;
	Tue, 11 Jan 2022 22:17:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
References: <20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
	<CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
	<3790640.1641819409@warthog.procyon.org.uk>
	<4126222.1641887321@warthog.procyon.org.uk>
To: Murphy Zhou <jencce.kernel@gmail.com>
MIME-Version: 1.0
Date: Tue, 11 Jan 2022 22:17:19 +0000
Message-ID: <491547.1641939439@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20BMHOQ5003570
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cachefs@redhat.com,
	Steve French <smfrench@gmail.com>
Subject: Re: [Linux-cachefs] [ linux-next ] 20211206 tree cifs panic
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
Content-ID: <491545.1641939439.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Can you try applying the attached patch?  It has some debugging to check that
the cifs file it's trying to close actually got opened.  It turns out that
some paths through were either managing to escape that or were going through
when they shouldn't have been.

David
---
commit cd7390c5e356efe67d93e4d1ba548c9c0ede4224
Author: David Howells <dhowells@redhat.com>
Date:   Tue Jan 11 19:44:42 2022 +0000

    fixes

diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
index 6186824b366e..bf3b4c9901b9 100644
--- a/fs/cifs/dir.c
+++ b/fs/cifs/dir.c
@@ -508,10 +508,12 @@ cifs_atomic_open(struct inode *inode, struct dentry *direntry,
 			server->ops->close(xid, tcon, &fid);
 		cifs_del_pending_open(&open);
 		rc = -ENOMEM;
+		goto out;
 	}
 
 	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
 			   file->f_mode & FMODE_WRITE);
+	file->f_mode |= 0x80000000;
 
 out:
 	cifs_put_tlink(tlink);
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
@@ -661,6 +648,20 @@ int cifs_open(struct inode *inode, struct file *file)
 				       cfile->pid);
 	}
 
+use_cache:
+	fscache_use_cookie(cifs_inode_cookie(file_inode(file)),
+			   file->f_mode & FMODE_WRITE);
+	file->f_mode |= 0x80000000;
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
@@ -885,7 +886,10 @@ int cifs_close(struct inode *inode, struct file *file)
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct cifs_deferred_close *dclose;
 
-	cifs_fscache_unuse_inode_cookie(inode, file->f_mode & FMODE_WRITE);
+	if (!(file->f_mode & 0x80000000))
+		printk("File not opened?\n");
+	else
+		cifs_fscache_unuse_inode_cookie(inode, file->f_mode & FMODE_WRITE);
 
 	if (file->private_data != NULL) {
 		cfile = file->private_data;
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 9bb1ab5fe5ed..08c8def8342a 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -571,6 +571,7 @@ void __fscache_use_cookie(struct fscache_cookie *cookie, bool will_modify)
 			     n_active, atomic_read(&cookie->n_accesses),
 			     will_modify ?
 			     fscache_active_use_modify : fscache_active_use);
+	ASSERTCMP(n_active, >, 0);
 
 again:
 	state = fscache_cookie_state(cookie);
@@ -657,6 +658,7 @@ void __fscache_unuse_cookie(struct fscache_cookie *cookie,
 		trace_fscache_active(debug_id, r, c - 1, a, fscache_active_unuse);
 		return;
 	}
+	ASSERTCMP(c, >, 0);
 
 	spin_lock(&cookie->lock);
 	r = refcount_read(&cookie->ref);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

