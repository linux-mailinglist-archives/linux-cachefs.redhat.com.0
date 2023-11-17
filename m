Return-Path: <linux-cachefs+bncBDLIXLMFVAERBP5R36VAMGQEENQVT6Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E377EF9E7
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:56 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d5b3a6a106sf2106280a34.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255935; cv=pass;
        d=google.com; s=arc-20160816;
        b=lEXBFm8wxslW5qruEwj9P3nBN6rf0cKUPRXeEnU2bD9C3HJPgvecpR4BCCLTyDEIb2
         RfK1NNMwXEew2rwOrVidb/Xmvwe86qZtociyLXb8brTgKP+45701n6iBi6iJ0OxdkdVN
         W39/hUP82NKMYx8kYPgSMuffWS646kiu5EcyJ6xjuL56gGYWeGX19Z/r1WDkO/3sGIYn
         nIkF2Mn6siX1gZOPFuA0d6MXJNeAKDf2TL6le5MDwEm7+sf5WZc0vvWFJA1gP518rpvs
         FvlBmaTyLl8w9Q6A3J3OYlaDkP/R8fFYcqhNS4xndBLs5PPQyPRs/vUR2lJtUWsuf1yf
         KNtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=6GrmjfntTx64ShkWojS4MPq54xKlNxsHY+NqFScEygY=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=KQln+yXT9w27YpBqN6ORgTasnphV95nHKBFgTWmG2NyDuL2GO2v+cOl5Vu9N/fXzdK
         OGPaZRrvWM8sTyAzOWuL+nk7sjRLAe36jZfbN2H3MtXqY4GRXVNKHvpTVxQa0Qsp49hG
         KEmEJhlDGVwImvs1Nwg7oVu9zEW9ZP3wp6Ep2jHXIaj/xqTL/MwNYG4XA5zX+wXvSDsk
         7ENbXoxI5K7rbYJcF/Dga4OXY7iya1ywLbJWYV93R+xoy6nQFPWqoyymSlcICuzFkzrp
         KIdr2VjZd7lB3v9FVwO+xz3/a9HxbBWIPIsnNqx51o61rMSoGlYKOPXkhCKVpCpRk3I0
         muNA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255935; x=1700860735;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GrmjfntTx64ShkWojS4MPq54xKlNxsHY+NqFScEygY=;
        b=PC9WT0OD7udOlwG1shaPHhmokqXKt1TVa3Er/DXzoNzSK9FM3+3QUfSL6iIYfvGKoo
         sB3AUFIBgg7RtVAjAXlLsSWtCRkXdbCLqupB29Doi3T4WJv+hgN5M+uTZ7pDmVfRvMDO
         AHJkMNeMdpPeLJNIp9PrF7LVshpOFW1SqkjMPW2g576XprLaMOm3LLASgwTDuIoqKHfr
         u3iwvv2abFdA8FBxOEqBUdzeS0xhH/LJdQnl7TPZcKhmBlRjkb1pDUvX19xsdVLEYqxe
         f526wJbK4klQYDSAhCjloODDO4HY7xaqZmsiuSJ+bwjgVL8UHQ01n2Lp4x0EXdyH80+z
         3OJg==
X-Gm-Message-State: AOJu0Yx+FAP7InXb8+lIUZrvp3Fg2espz5TDFqJPyxUN2PKmgAaXP3b8
	rRb70IAjoa4pSJYvf1s0xxSGEQ==
X-Google-Smtp-Source: AGHT+IHdaKCN7ZA73kRFN8paByymc+c073xbbJiaqW6nYXgkTFAFDRAeJhgk2oV8oxvlPJCxUSw9TQ==
X-Received: by 2002:a9d:6d17:0:b0:6b8:7d12:423d with SMTP id o23-20020a9d6d17000000b006b87d12423dmr412333otp.18.1700255935463;
        Fri, 17 Nov 2023 13:18:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:fde6:0:b0:66d:6af7:454e with SMTP id m6-20020a0cfde6000000b0066d6af7454els900857qvu.1.-pod-prod-06-us;
 Fri, 17 Nov 2023 13:18:54 -0800 (PST)
X-Received: by 2002:a05:6102:34e2:b0:457:cc6c:9491 with SMTP id bi2-20020a05610234e200b00457cc6c9491mr708018vsb.17.1700255934842;
        Fri, 17 Nov 2023 13:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255934; cv=none;
        d=google.com; s=arc-20160816;
        b=gHhE0fmBjeyrmuclE2gzTrjX+efjSg5PJTPcIOh4n2LyoYXUMpQK9yXm8RjXT5MN1x
         SV92Lc4Y1/NKtTDIisRuSerXvFVkxjtvt7Elf1LwosbGdd1ptDCCpdKzz7OMXCJ4fqhd
         STCH3TJwux6Am9BKXWqCAtbVn9CLAZjDgpTCxmIIEEp4WC16zwH3QIyHpVaPVyl5XAik
         WHVZ0/0cCPM1Tzj5rvS57pwm05vWBzVBCUiF8PnAXFVpOLd4xvGQeYepAk/ZWFmgnXDp
         lIhfXnDFxl6GmlT9cAAANye96GY4wFkIL0A3Yr6dRMXJaldI2Nk5s//NZehm1fIvsOIO
         BxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wytdEGMiDkVc14tR/9rfg5yMQrHZM30J/9oi3ehTfaw=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=0vZihzybLN90clSfVom8M4Zx279e+IXzSB4MWYcMOi6cdF5U1iNamDQZI2+ZDHOd0x
         Q3aG3+CuHwEfKNW5uYDZcq+wdRdoDqOUYtri8EQQygFg9KhxZ91V4XJFFyc58vg7ddem
         lVux3oKC9vxXP339ifzAsNIrg/Ps/doSvqIQrJO55siDDfzjqI2ZmThzav6v0DKEyOZw
         I36fDg3tFsfULMcxtNK+GlC9CsrbTbH87lC7wuXsOKfBfepipe1kobvYEe6RRs1aqHN3
         bGtfQpCTMMWF2PkI0OAwlyQ/VyIiCzNNtbSgA6IKfnGYS3HNF7HavY76egmJmMbt1Tzi
         Nmkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id h6-20020a67cb86000000b0044d40c14d6bsi578837vsl.350.2023.11.17.13.18.54
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:54 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-cGyfVLbROHmr8Yq7pTb-Hw-1; Fri, 17 Nov 2023 16:18:51 -0500
X-MC-Unique: cGyfVLbROHmr8Yq7pTb-Hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D8F0185A789
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 71F591121309; Fri, 17 Nov 2023 21:18:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80EF91121306;
	Fri, 17 Nov 2023 21:18:48 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
Subject: [PATCH v2 47/51] cifs: Move cifs_loose_read_iter() and cifs_file_write_iter() to file.c
Date: Fri, 17 Nov 2023 21:15:39 +0000
Message-ID: <20231117211544.1740466-48-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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
index c7d8251c28d5..439473aff211 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -982,61 +982,6 @@ cifs_smb3_do_mount(struct file_system_type *fs_type,
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
index 36128a39e417..5ecbda31ba85 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -4583,6 +4583,59 @@ ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to)
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

