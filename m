Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXNB46VQMGQE5WIESPA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 858548117A3
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:22 +0100 (CET)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3b88ac1f09csf10625532b6e.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482141; cv=pass;
        d=google.com; s=arc-20160816;
        b=sLV8WhD81jB2FzyvKX4F+R6GXMFmkPuUgSfTcVOB/oiF3kUzey0zwHuazUuZc19uKP
         z0zJk3pevD7p3FotoO5QtIZyWx4WHqu4ZZmjtkODuVyKUZlGIdSmx/p/OJ4xp4kF2H/h
         emqAUTe0NDtn4l+dw3BEJ/nzoCx84crRp7pLTYq+u1idh767f+FV9m4pM3emxnriNTjW
         +UQTPUjrVUjxqIbFuSFLIY2VIUPeoKipYOfHeZEOOIJd7vaXhTN3H1+khOQ53q6bUcrA
         0N57+9G8V5gqHdhFz/6WUM7zp7P1+rpFJ/VWh+gvJLMEviaZYSYBpV06oxMcUHhpLQLg
         qznA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+9gE3zPm2MJyUQYxBbsFlRSjALq3bP4vCNK6uOuaGWY=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=Kqg/MqtYcR8jODoqlAuh8CVrhF3QtK/EafxG5NYLO/H5m3veenDgGsO9KMvj+utoQl
         dziXEcIcOsudNIrPylYHms96yI771PZri8T9wl2mgIUtOrMWYVmTGcfKcvhwJzXnbkzC
         ozIvm3+qYbPrr4aq0NS3Uy/yFqVV0WQ1lqcwGwVw8bDHjOPMyq1s775/96F4jfuwE35m
         U4iSjuMb8PUphiaEWP65Mjgc0w4tovUJw4jP+Xbhx0eaQ1r08h1E+J7Mb0K0N/oCHBcM
         3/Vt2KFcEAqWoLYtTTmwZeB/0WCmPAfEzfufnD6C/CVHy2kzxVoHYWECXSOBT9xcOAo9
         M+ng==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482141; x=1703086941;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9gE3zPm2MJyUQYxBbsFlRSjALq3bP4vCNK6uOuaGWY=;
        b=jBzJeaRJDW/D1DjCstw/1QwAOjghtv1RfZOzbYY35G2NXLa2qIKL1OSJu3Yn06Vfpe
         lt92bKrvvcsS64TgZ8wjMFHb2YF5aRrldI7DAC2Wr3JxigpUEDUxjFnjQHkapw8mkDlB
         u6uf4zTpV0/ypwQ68NvEJ1npjdYVaY34u8sVi8Ug5w6kT8WlMDykjM5jK1bh1gUBLbGx
         r/0RKFdF0S8QLPkK7xm5IC7PrQdg7m/JpU90FQUlwZ5/WkYEDVoyNKyuxy1t41Wlpa09
         7SIK+kYPJRi/hS8NrCvNg02SB95Kar+316B7nOfeYymM0w6TnZVbUNAGhWAFLPY9C4Nq
         w+EQ==
X-Gm-Message-State: AOJu0YyPH7KhQcJ7hwUVCpX4F7yTk12lxrLyUJsSFF/UXzhkqtJfBYG4
	eVU11g1dSP/zj+oo464tCt0/pA==
X-Google-Smtp-Source: AGHT+IHZ/uFl0nkiQSeQItjzwyY7ID0Ui8MH7bvKp/arRxGVF+PuO0vA4B0jjHOw5pLPiQE3E1ZM+A==
X-Received: by 2002:a05:6808:3196:b0:3ba:382:c0e1 with SMTP id cd22-20020a056808319600b003ba0382c0e1mr6089395oib.62.1702482141360;
        Wed, 13 Dec 2023 07:42:21 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:190b:b0:41e:8c36:f7a3 with SMTP id
 w11-20020a05622a190b00b0041e8c36f7a3ls219591qtc.2.-pod-prod-03-us; Wed, 13
 Dec 2023 07:42:20 -0800 (PST)
X-Received: by 2002:a05:622a:1998:b0:425:7f1a:c4a2 with SMTP id u24-20020a05622a199800b004257f1ac4a2mr11475394qtc.7.1702482140700;
        Wed, 13 Dec 2023 07:42:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482140; cv=none;
        d=google.com; s=arc-20160816;
        b=d/cxW/RoJ9r2mJbM05MseMTVOIXse6CDKZphkUzqjK5SYbs6QtBZQsvgUH+2Z7EerV
         jpizVV3+f2JAZaG4O9f08kkWSRlv9krj8jJvQpnOzCdXTBn2Z2M7Mp6gUf/u5Azt1omk
         1DuAsjudknSFDKsyzugUz/wWI1gYfLwtJGQD8IT+og+LUN4ueNAyn275LjQ67hGnIBYP
         t9CvZJY91ZrhbE1KOAIyQXCSn60ck3XI/Cp0K6W2MJ3RKu30VJepdvJHaZBLi7eieYws
         b3jn/RgFDI8rsJgGIBLaKLfjbZirzMtfslRWYlOib3VMCmYoWtHLZniXCsC0k617tkrh
         gzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=CTmXKlaARSc+/4qCQwpNxe6YLvLKHn4pqqsvYn+RGCg=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=QvnR6xUX8ywwvp/MuXzUQSr1tRmuMGAvrkvujDkP4SNJMNt+0SxSaMe10Yk9gFJPtX
         Vqkv6ljS9CqyED1zfIUuorimSbt4ZhLbktHy2EKLIRzdpxJE2TDJE2wiArlF2uUcHb0w
         KCoJmrD7l3jrllicVCjvGa9bYMVnm/hS6ZJbUTgr0hQ3vuY4r0AR7RrMmTycUZJc2PfU
         y/RKCDZMjbnryPwOlqlRdf4x10+/HpkmrAfRYZxdyE0wb5EAHZE1egN25fmpNLAn7Y7l
         /ibevE4fFfM2EElxTbOjAxjUNrE8mPzPGgAUtt9OaqnkhxuQs+nkv2PEzlxhDKa8fmul
         94QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b00425aece86a0si11666381qtf.499.2023.12.13.07.42.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:42:20 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-Yha1XZ_gOcmKkzY_Mwz7lA-1; Wed, 13 Dec 2023 10:42:19 -0500
X-MC-Unique: Yha1XZ_gOcmKkzY_Mwz7lA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCD3185A59A
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:42:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D72DD1121306; Wed, 13 Dec 2023 15:42:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BA501121312;
	Wed, 13 Dec 2023 15:42:15 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v4 09/13] cifs: Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c
Date: Wed, 13 Dec 2023 15:41:35 +0000
Message-ID: <20231213154139.432922-10-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c so that
they are colocated with similar functions rather than being split with
cifsfs.c.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsfs.c | 55 ------------------------------------------
 fs/smb/client/cifsfs.h |  2 ++
 fs/smb/client/file.c   | 53 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index ebe04c78a955..1cd9309e46f7 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -981,61 +981,6 @@ cifs_smb3_do_mount(struct file_system_type *fs_type,
 	return root;
 }
 
-
-static ssize_t
-cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
-{
-	ssize_t rc;
-	struct inode *inode = file_inode(iocb->ki_filp);
-
-	if (iocb->ki_flags & IOCB_DIRECT)
-		return cifs_user_readv(iocb, iter);
-
-	rc = cifs_revalidate_mapping(inode);
-	if (rc)
-		return rc;
-
-	return generic_file_read_iter(iocb, iter);
-}
-
-static ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
-{
-	struct inode *inode = file_inode(iocb->ki_filp);
-	struct cifsInodeInfo *cinode = CIFS_I(inode);
-	ssize_t written;
-	int rc;
-
-	if (iocb->ki_filp->f_flags & O_DIRECT) {
-		written = cifs_user_writev(iocb, from);
-		if (written > 0 && CIFS_CACHE_READ(cinode)) {
-			cifs_zap_mapping(inode);
-			cifs_dbg(FYI,
-				 "Set no oplock for inode=%p after a write operation\n",
-				 inode);
-			cinode->oplock = 0;
-		}
-		return written;
-	}
-
-	written = cifs_get_writer(cinode);
-	if (written)
-		return written;
-
-	written = generic_file_write_iter(iocb, from);
-
-	if (CIFS_CACHE_WRITE(CIFS_I(inode)))
-		goto out;
-
-	rc = filemap_fdatawrite(inode->i_mapping);
-	if (rc)
-		cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
-			 rc, inode);
-
-out:
-	cifs_put_writer(cinode);
-	return written;
-}
-
 static loff_t cifs_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct cifsFileInfo *cfile = file->private_data;
diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index 3adea10aa9da..28c41c449205 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -100,6 +100,8 @@ extern ssize_t cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to);
 extern ssize_t cifs_user_writev(struct kiocb *iocb, struct iov_iter *from);
 extern ssize_t cifs_direct_writev(struct kiocb *iocb, struct iov_iter *from);
 extern ssize_t cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from);
+ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from);
+ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 extern int cifs_flock(struct file *pfile, int cmd, struct file_lock *plock);
 extern int cifs_lock(struct file *, int, struct file_lock *);
 extern int cifs_fsync(struct file *, loff_t, loff_t, int);
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 255d78581e56..dfeb8cb86d61 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -4567,6 +4567,59 @@ ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to)
 	return __cifs_readv(iocb, to, false);
 }
 
+ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	ssize_t rc;
+	struct inode *inode = file_inode(iocb->ki_filp);
+
+	if (iocb->ki_flags & IOCB_DIRECT)
+		return cifs_user_readv(iocb, iter);
+
+	rc = cifs_revalidate_mapping(inode);
+	if (rc)
+		return rc;
+
+	return generic_file_read_iter(iocb, iter);
+}
+
+ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct cifsInodeInfo *cinode = CIFS_I(inode);
+	ssize_t written;
+	int rc;
+
+	if (iocb->ki_filp->f_flags & O_DIRECT) {
+		written = cifs_user_writev(iocb, from);
+		if (written > 0 && CIFS_CACHE_READ(cinode)) {
+			cifs_zap_mapping(inode);
+			cifs_dbg(FYI,
+				 "Set no oplock for inode=%p after a write operation\n",
+				 inode);
+			cinode->oplock = 0;
+		}
+		return written;
+	}
+
+	written = cifs_get_writer(cinode);
+	if (written)
+		return written;
+
+	written = generic_file_write_iter(iocb, from);
+
+	if (CIFS_CACHE_WRITE(CIFS_I(inode)))
+		goto out;
+
+	rc = filemap_fdatawrite(inode->i_mapping);
+	if (rc)
+		cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
+			 rc, inode);
+
+out:
+	cifs_put_writer(cinode);
+	return written;
+}
+
 ssize_t
 cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to)
 {

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

