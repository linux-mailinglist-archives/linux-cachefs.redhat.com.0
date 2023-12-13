Return-Path: <linux-cachefs+bncBDLIXLMFVAERBR5B46VQMGQEJ57WF2I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id AA004811796
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:00 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ee8a447b3sf30301906d6.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482119; cv=pass;
        d=google.com; s=arc-20160816;
        b=av89wl8xl+K8Ql3oVTgIOJzY47qjxljxUrc33HCKgDvQAxNcG1c/HLaDzmPMTuGho9
         bPDOaCg7wbMH5dhHwhGq5pamtwZbg9OCRrfiOte8txk9i+iwNnGyCtgEQZ4c+Nse7uIb
         w3VPhvrqS1qPOL+0SEm4eeOtZ4BLL/uFyeJAI4ItWhLvbBlnN5lVKvrHu57wjD8RKd/m
         s02RGk+E1Y0Vtwvexp1FssiabtHlzJ7yjzFOvk6YoQGuUnQBs116h6BoyXFWocVZOIZW
         ZJBxHKV20qlpWrx/dN41W3zX9RaVbUVwfI6XOzifj+EmCMLLXNBtHLopRaSbsP312+NU
         is3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=RMcLbufLkfRDEdO6toBXYWjrf3mQGrqwqjnwni5AkVc=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=bKyGDyBGAnX/6IwrPrzxIyA5fgmf6gOjI/hyHfjU0KjPY9/nZh2chbLKivQuwrmgUr
         QJanBexNsFQWwoyuYSOsTUoO4Uzy7ICQd2tqYt/XEgnWIKny60H6e2kTgPqzSYbcVWEb
         1UmQhcwQibFWJ01KKm0hLSVDanpkv/Wy2YpctPy4UvdacoRX6wIE9KyptsYpsCeuLWKn
         wdM+zlAKWAoR5BDtmGB5l0rYZbLPRd6Otn0w4gj4+PayxHjlXtzyEvNlr7FdedPBQXu7
         Hqea19zOOHgmh02hIaEZTcEIB7A4raOO1JymPrcVyTaFlc7Buldf5n5zlYWkx0shN314
         LltA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482119; x=1703086919;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMcLbufLkfRDEdO6toBXYWjrf3mQGrqwqjnwni5AkVc=;
        b=eVi/yvpFovHt9L1gIoSzoCIKefx1fK6ZUg2z6YbVEOfOakQmHS5fV8VaiUcsvL8fO3
         sRyKbC+dlZ6RnJjZWq+4nBM9lsNJFthVIgB3cobnMnXDY4nwdlE/NP5EyBeqqdY/1YYc
         222/stU/wQTidkOldOE5na49d7n3CFIKB/7j8Nc/aCS7E8UXszSk8OUFn7XtkDDT2Kvd
         KhukUelXW8idEUH/SszBKv0SGgnk8Q7lcQaMe1Dmhu70PUxgI/xV9HuRe1Wo8WMbfQCy
         7t4TBpgZG60i1DaF/NAz6NgiheX5BbHyPpnDuGelJuoXO6ilXlwb3UTory8BuwZ3ZtJU
         8ICw==
X-Gm-Message-State: AOJu0YxAeozdd7yL2LYerl0PMSDRfuDNXS2DA5OpxLtX0BffxuzDohZk
	MmT0sdrSIjv1ddiX0bRxiXuTwQ==
X-Google-Smtp-Source: AGHT+IGKAwTvO/qJTbvIB7fZp4rwE1OfVO5NuHgY0wjxw2ERyqiKpPUaGuoHVVO4p0pGQ+0mYjHFLA==
X-Received: by 2002:ad4:5be8:0:b0:67a:a72d:fba7 with SMTP id k8-20020ad45be8000000b0067aa72dfba7mr14325242qvc.37.1702482119622;
        Wed, 13 Dec 2023 07:41:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e80c:0:b0:67a:94b0:82e8 with SMTP id y12-20020a0ce80c000000b0067a94b082e8ls1182449qvn.0.-pod-prod-00-us;
 Wed, 13 Dec 2023 07:41:59 -0800 (PST)
X-Received: by 2002:ad4:4eeb:0:b0:67e:a9cd:eec2 with SMTP id dv11-20020ad44eeb000000b0067ea9cdeec2mr14092026qvb.55.1702482118970;
        Wed, 13 Dec 2023 07:41:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482118; cv=none;
        d=google.com; s=arc-20160816;
        b=bzzqrMW+f9LeUy/cM5CETK9nKIt8XSrfycXvysbarHhvJknBflOBP5m253decV/zEI
         HhdSGk1XgO8dG4tLL7mcWEvODYSY0GRtoIwbnPZ7/taSX06Mlf+yY+fOznDykZD59xXg
         jk4fZC3SfChny/J2SKM/K2jbdHoIjMk1ym1KM2DOUR56uAbPk9QyvlbiUy6f3Fa9Wp9r
         9YP5v7TTxnHtDjhTk0WCV8Vvr1Nk/S+hiS98XgeI+pN/Zz5Q0vCc6AAAaspljonPP8Cb
         TIaN3u5A5wsyY921ipMxwhSLCEtiCZAgxvkkJ5H0cuw3696ymdEQwZ1nRe9j6F5WVlDn
         AIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=xZZIk30PZWvT12sUmo9YRTsF0KDDaXx/g5Y5JLkwlQg=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=roWQb+Kbq68sykzuYTYCqvNxKQhj8osltke4rjGABCobipk/sKAbmuwcZIZ3qgTLJU
         iXHc3cAqGIybyxF3gsEP7CYGwEv1HdBenCrmlCX2QszaoV0FtQ36YXNGMxLRktnhd++j
         WxxA2YH1PQhA9FnfJWGPkK39Z7avGFItpKjoYDQnyY0ZW0JnScUi+uzFhbpXCIaxuxFD
         Z1UvCfNiz6ikUHHjTjDXXW9mQedgTlH0nsfhvNStpbBrOT3JqswFbd0r8KPgg8cRLAip
         6azqarBO9x2FiwZQ9WRKQMdLsGBzGrDdKzu1/PnP6jDd9wPiWXLqOyLgSDgiEZexT5yz
         xIZA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o1-20020ad45c81000000b0067efda89747si1181676qvh.147.2023.12.13.07.41.58
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:41:58 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-B52K-2lTMOS8q5VrxLnlug-1; Wed, 13 Dec 2023 10:41:57 -0500
X-MC-Unique: B52K-2lTMOS8q5VrxLnlug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E961185A786
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:41:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1BC16C15968; Wed, 13 Dec 2023 15:41:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39DA1C1596E;
	Wed, 13 Dec 2023 15:41:54 +0000 (UTC)
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
Subject: [PATCH v4 03/13] cifs: Share server EOF pos with netfslib
Date: Wed, 13 Dec 2023 15:41:29 +0000
Message-ID: <20231213154139.432922-4-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
 fs/smb/client/cifsfs.c   | 17 ++++++++++++++---
 fs/smb/client/cifsglob.h |  1 -
 fs/smb/client/file.c     |  8 ++++----
 fs/smb/client/inode.c    |  8 +++++---
 fs/smb/client/smb2ops.c  | 18 +++++++++++++-----
 5 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 07cd88897c33..078cff36cd2e 100644
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
@@ -1377,6 +1377,7 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 	struct inode *src_inode = file_inode(src_file);
 	struct inode *target_inode = file_inode(dst_file);
 	struct cifsInodeInfo *src_cifsi = CIFS_I(src_inode);
+	struct cifsInodeInfo *target_cifsi = CIFS_I(target_inode);
 	struct cifsFileInfo *smb_file_src;
 	struct cifsFileInfo *smb_file_target;
 	struct cifs_tcon *src_tcon;
@@ -1425,7 +1426,7 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 	 * Advance the EOF marker after the flush above to the end of the range
 	 * if it's short of that.
 	 */
-	if (src_cifsi->server_eof < off + len) {
+	if (src_cifsi->netfs.remote_i_size < off + len) {
 		rc = cifs_precopy_set_eof(src_inode, src_cifsi, src_tcon, xid, off + len);
 		if (rc < 0)
 			goto unlock;
@@ -1449,12 +1450,22 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 	/* Discard all the folios that overlap the destination region. */
 	truncate_inode_pages_range(&target_inode->i_data, fstart, fend);
 
+	fscache_invalidate(cifs_inode_cookie(target_inode), NULL,
+			   i_size_read(target_inode), 0);
+
 	rc = file_modified(dst_file);
 	if (!rc) {
 		rc = target_tcon->ses->server->ops->copychunk_range(xid,
 			smb_file_src, smb_file_target, off, len, destoff);
-		if (rc > 0 && destoff + rc > i_size_read(target_inode))
+		if (rc > 0 && destoff + rc > i_size_read(target_inode)) {
 			truncate_setsize(target_inode, destoff + rc);
+			netfs_resize_file(&target_cifsi->netfs,
+					  i_size_read(target_inode), true);
+			fscache_resize_cookie(cifs_inode_cookie(target_inode),
+					      i_size_read(target_inode));
+		}
+		if (rc > 0 && destoff + rc > target_cifsi->netfs.zero_point)
+			target_cifsi->netfs.zero_point = destoff + rc;
 	}
 
 	file_accessed(src_file);
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 65820f40f7f4..ed456c6a2752 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1539,7 +1539,6 @@ struct cifsInodeInfo {
 	spinlock_t writers_lock;
 	unsigned int writers;		/* Number of writers on this inode */
 	unsigned long time;		/* jiffies of last update of inode */
-	u64  server_eof;		/* current file size on server -- protected by i_lock */
 	u64  uniqueid;			/* server inode number */
 	u64  createtime;		/* creation time on server */
 	__u8 lease_key[SMB2_LEASE_KEY_SIZE];	/* lease key for this inode */
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index ca697bda4666..1074d56573b7 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2118,8 +2118,8 @@ cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
 {
 	loff_t end_of_write = offset + bytes_written;
 
-	if (end_of_write > cifsi->server_eof)
-		cifsi->server_eof = end_of_write;
+	if (end_of_write > cifsi->netfs.remote_i_size)
+		netfs_resize_file(&cifsi->netfs, end_of_write, true);
 }
 
 static ssize_t
@@ -3245,8 +3245,8 @@ cifs_uncached_writev_complete(struct work_struct *work)
 
 	spin_lock(&inode->i_lock);
 	cifs_update_eof(cifsi, wdata->offset, wdata->bytes);
-	if (cifsi->server_eof > inode->i_size)
-		i_size_write(inode, cifsi->server_eof);
+	if (cifsi->netfs.remote_i_size > inode->i_size)
+		i_size_write(inode, cifsi->netfs.remote_i_size);
 	spin_unlock(&inode->i_lock);
 
 	complete(&wdata->done);
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index 09c5c0f5c96e..e8afdc969226 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -104,7 +104,7 @@ cifs_revalidate_cache(struct inode *inode, struct cifs_fattr *fattr)
 	fattr->cf_mtime = timestamp_truncate(fattr->cf_mtime, inode);
 	mtime = inode_get_mtime(inode);
 	if (timespec64_equal(&mtime, &fattr->cf_mtime) &&
-	    cifs_i->server_eof == fattr->cf_eof) {
+	    cifs_i->netfs.remote_i_size == fattr->cf_eof) {
 		cifs_dbg(FYI, "%s: inode %llu is unchanged\n",
 			 __func__, cifs_i->uniqueid);
 		return;
@@ -193,7 +193,7 @@ cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr)
 	else
 		clear_bit(CIFS_INO_DELETE_PENDING, &cifs_i->flags);
 
-	cifs_i->server_eof = fattr->cf_eof;
+	cifs_i->netfs.remote_i_size = fattr->cf_eof;
 	/*
 	 * Can't safely change the file size here if the client is writing to
 	 * it due to potential races.
@@ -2827,7 +2827,7 @@ cifs_set_file_size(struct inode *inode, struct iattr *attrs,
 
 set_size_out:
 	if (rc == 0) {
-		cifsInode->server_eof = attrs->ia_size;
+		netfs_resize_file(&cifsInode->netfs, attrs->ia_size, true);
 		cifs_setsize(inode, attrs->ia_size);
 		/*
 		 * i_blocks is not related to (i_size / i_blksize), but instead
@@ -2980,6 +2980,7 @@ cifs_setattr_unix(struct dentry *direntry, struct iattr *attrs)
 	if ((attrs->ia_valid & ATTR_SIZE) &&
 	    attrs->ia_size != i_size_read(inode)) {
 		truncate_setsize(inode, attrs->ia_size);
+		netfs_resize_file(&cifsInode->netfs, attrs->ia_size, true);
 		fscache_resize_cookie(cifs_inode_cookie(inode), attrs->ia_size);
 	}
 
@@ -3179,6 +3180,7 @@ cifs_setattr_nounix(struct dentry *direntry, struct iattr *attrs)
 	if ((attrs->ia_valid & ATTR_SIZE) &&
 	    attrs->ia_size != i_size_read(inode)) {
 		truncate_setsize(inode, attrs->ia_size);
+		netfs_resize_file(&cifsInode->netfs, attrs->ia_size, true);
 		fscache_resize_cookie(cifs_inode_cookie(inode), attrs->ia_size);
 	}
 
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index a441785b4cf1..57731bff49b1 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -3357,6 +3357,9 @@ static long smb3_zero_range(struct file *file, struct cifs_tcon *tcon,
 				  cfile->fid.volatile_fid, cfile->pid, &eof);
 		if (rc >= 0) {
 			truncate_setsize(inode, new_size);
+			netfs_resize_file(&cifsi->netfs, new_size, true);
+			if (offset < cifsi->netfs.zero_point)
+				cifsi->netfs.zero_point = offset;
 			fscache_resize_cookie(cifs_inode_cookie(inode), new_size);
 		}
 	}
@@ -3580,7 +3583,7 @@ static long smb3_simple_falloc(struct file *file, struct cifs_tcon *tcon,
 		rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 				  cfile->fid.volatile_fid, cfile->pid, &eof);
 		if (rc == 0) {
-			cifsi->server_eof = off + len;
+			netfs_resize_file(&cifsi->netfs, off + len, true);
 			cifs_setsize(inode, off + len);
 			cifs_truncate_page(inode->i_mapping, inode->i_size);
 			truncate_setsize(inode, off + len);
@@ -3672,8 +3675,9 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 	int rc;
 	unsigned int xid;
 	struct inode *inode = file_inode(file);
-	struct cifsFileInfo *cfile = file->private_data;
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
+	struct cifsFileInfo *cfile = file->private_data;
+	struct netfs_inode *ictx = &cifsi->netfs;
 	__le64 eof;
 	loff_t old_eof;
 
@@ -3694,6 +3698,7 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 		goto out_2;
 
 	truncate_pagecache_range(inode, off, old_eof);
+	ictx->zero_point = old_eof;
 
 	rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
 				  old_eof - off - len, off);
@@ -3708,9 +3713,10 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 
 	rc = 0;
 
-	cifsi->server_eof = i_size_read(inode) - len;
-	truncate_setsize(inode, cifsi->server_eof);
-	fscache_resize_cookie(cifs_inode_cookie(inode), cifsi->server_eof);
+	truncate_setsize(inode, eof);
+	netfs_resize_file(&cifsi->netfs, eof, true);
+	ictx->zero_point = eof;
+	fscache_resize_cookie(cifs_inode_cookie(inode), eof);
 out_2:
 	filemap_invalidate_unlock(inode->i_mapping);
  out:
@@ -3726,6 +3732,7 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
 	unsigned int xid;
 	struct cifsFileInfo *cfile = file->private_data;
 	struct inode *inode = file_inode(file);
+	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 	__le64 eof;
 	__u64  count, old_eof;
 
@@ -3754,6 +3761,7 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
 		goto out_2;
 
 	truncate_setsize(inode, old_eof + len);
+	netfs_resize_file(&cifsi->netfs, i_size_read(inode), true);
 	fscache_resize_cookie(cifs_inode_cookie(inode), i_size_read(inode));
 
 	rc = smb2_copychunk_range(xid, cfile, cfile, off, count, off + len);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

