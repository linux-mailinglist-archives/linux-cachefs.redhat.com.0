Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C50217C89E3
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Oct 2023 18:07:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697213233;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o3wd7nuJT2LgKXxcgYsCG14DYSkaT1Eq0ySOg8Zu2Go=;
	b=WQ2yFqTpd8lYJvrCKzxBiT4mBh/VCvA63jgG4wjrebZUqHu82t+9g4aWUf7xvue2G+JMIi
	3LT49SGGkm0maVAk02UOkmclr12LLYzIIAfYd3V1AdCHpMAMKv7S5Jfsm/+4qGi6wS3Zih
	IX1AFUYpTnauMUBwlnW3p3YVdqjqj+U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-irxXlsR6PYajkd6D-ema6Q-1; Fri, 13 Oct 2023 12:07:05 -0400
X-MC-Unique: irxXlsR6PYajkd6D-ema6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6464946DC6;
	Fri, 13 Oct 2023 16:07:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC82E2157F5A;
	Fri, 13 Oct 2023 16:07:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B272919465A2;
	Fri, 13 Oct 2023 16:07:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DF87F1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 13 Oct 2023 16:07:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CB6D8492BE2; Fri, 13 Oct 2023 16:07:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB8EB492BD9;
 Fri, 13 Oct 2023 16:06:58 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Date: Fri, 13 Oct 2023 17:04:13 +0100
Message-ID: <20231013160423.2218093-45-dhowells@redhat.com>
In-Reply-To: <20231013160423.2218093-1-dhowells@redhat.com>
References: <20231013160423.2218093-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Subject: [Linux-cachefs] [RFC PATCH 44/53] cifs: Share server EOF pos with
 netfslib
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
Cc: Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Shyam Prasad N <nspmangalore@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 ceph-devel@vger.kernel.org, Christian Brauner <christian@brauner.io>,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use cifsi->netfs_ctx.remote_i_size instead of cifsi->server_eof so that
netfslib can refer to it to.

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
 fs/smb/client/cifsfs.c   |  2 +-
 fs/smb/client/cifsglob.h |  1 -
 fs/smb/client/file.c     |  8 ++++----
 fs/smb/client/inode.c    |  6 +++---
 fs/smb/client/smb2ops.c  | 10 +++++-----
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 22869cda1356..85799e9e0f4c 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -395,7 +395,7 @@ cifs_alloc_inode(struct super_block *sb)
 	spin_lock_init(&cifs_inode->writers_lock);
 	cifs_inode->writers = 0;
 	cifs_inode->netfs.inode.i_blkbits = 14;  /* 2**14 = CIFS_MAX_MSGSIZE */
-	cifs_inode->server_eof = 0;
+	cifs_inode->netfs.remote_i_size = 0;
 	cifs_inode->uniqueid = 0;
 	cifs_inode->createtime = 0;
 	cifs_inode->epoch = 0;
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 22fa98428845..1943d035b8d3 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1527,7 +1527,6 @@ struct cifsInodeInfo {
 	spinlock_t writers_lock;
 	unsigned int writers;		/* Number of writers on this inode */
 	unsigned long time;		/* jiffies of last update of inode */
-	u64  server_eof;		/* current file size on server -- protected by i_lock */
 	u64  uniqueid;			/* server inode number */
 	u64  createtime;		/* creation time on server */
 	__u8 lease_key[SMB2_LEASE_KEY_SIZE];	/* lease key for this inode */
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index b4f16ef62115..0383ce61ac35 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2117,8 +2117,8 @@ cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
 {
 	loff_t end_of_write = offset + bytes_written;
 
-	if (end_of_write > cifsi->server_eof)
-		cifsi->server_eof = end_of_write;
+	if (end_of_write > cifsi->netfs.remote_i_size)
+		netfs_resize_file(&cifsi->netfs, end_of_write);
 }
 
 static ssize_t
@@ -3246,8 +3246,8 @@ cifs_uncached_writev_complete(struct work_struct *work)
 
 	spin_lock(&inode->i_lock);
 	cifs_update_eof(cifsi, wdata->offset, wdata->bytes);
-	if (cifsi->server_eof > inode->i_size)
-		i_size_write(inode, cifsi->server_eof);
+	if (cifsi->netfs.remote_i_size > inode->i_size)
+		i_size_write(inode, cifsi->netfs.remote_i_size);
 	spin_unlock(&inode->i_lock);
 
 	complete(&wdata->done);
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index d7c302442c1e..6815b50ec56c 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -102,7 +102,7 @@ cifs_revalidate_cache(struct inode *inode, struct cifs_fattr *fattr)
 	 /* revalidate if mtime or size have changed */
 	fattr->cf_mtime = timestamp_truncate(fattr->cf_mtime, inode);
 	if (timespec64_equal(&inode->i_mtime, &fattr->cf_mtime) &&
-	    cifs_i->server_eof == fattr->cf_eof) {
+	    cifs_i->netfs.remote_i_size == fattr->cf_eof) {
 		cifs_dbg(FYI, "%s: inode %llu is unchanged\n",
 			 __func__, cifs_i->uniqueid);
 		return;
@@ -191,7 +191,7 @@ cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr)
 	else
 		clear_bit(CIFS_INO_DELETE_PENDING, &cifs_i->flags);
 
-	cifs_i->server_eof = fattr->cf_eof;
+	cifs_i->netfs.remote_i_size = fattr->cf_eof;
 	/*
 	 * Can't safely change the file size here if the client is writing to
 	 * it due to potential races.
@@ -2776,7 +2776,7 @@ cifs_set_file_size(struct inode *inode, struct iattr *attrs,
 
 set_size_out:
 	if (rc == 0) {
-		cifsInode->server_eof = attrs->ia_size;
+		netfs_resize_file(&cifsInode->netfs, attrs->ia_size);
 		cifs_setsize(inode, attrs->ia_size);
 		/*
 		 * i_blocks is not related to (i_size / i_blksize), but instead
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index dc18130db9b3..e7f765673246 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -3554,7 +3554,7 @@ static long smb3_simple_falloc(struct file *file, struct cifs_tcon *tcon,
 		rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 				  cfile->fid.volatile_fid, cfile->pid, &eof);
 		if (rc == 0) {
-			cifsi->server_eof = off + len;
+			netfs_resize_file(&cifsi->netfs, off + len);
 			cifs_setsize(inode, off + len);
 			cifs_truncate_page(inode->i_mapping, inode->i_size);
 			truncate_setsize(inode, off + len);
@@ -3646,8 +3646,8 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 	int rc;
 	unsigned int xid;
 	struct inode *inode = file_inode(file);
-	struct cifsFileInfo *cfile = file->private_data;
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
+	struct cifsFileInfo *cfile = file->private_data;
 	__le64 eof;
 	loff_t old_eof;
 
@@ -3682,9 +3682,9 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 
 	rc = 0;
 
-	cifsi->server_eof = i_size_read(inode) - len;
-	truncate_setsize(inode, cifsi->server_eof);
-	fscache_resize_cookie(cifs_inode_cookie(inode), cifsi->server_eof);
+	netfs_resize_file(&cifsi->netfs, eof);
+	truncate_setsize(inode, eof);
+	fscache_resize_cookie(cifs_inode_cookie(inode), eof);
 out_2:
 	filemap_invalidate_unlock(inode->i_mapping);
  out:
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

