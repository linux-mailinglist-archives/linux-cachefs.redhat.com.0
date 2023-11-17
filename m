Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKVR36VAMGQE6PYA3QY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D317EF9D4
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:36 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6d64f84b8besf2783473a34.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255915; cv=pass;
        d=google.com; s=arc-20160816;
        b=wSBQ8Q5mGJ6Wt+Ii39mfTc2v73bbBa7pc71JYxV0GhZUdpEsfHYnNY1qkfWN60ECoU
         /BlhLyximW5rPptxWUAnAoKAB8i+L1z8SQOwT0BevwTOxv3A5xR4dVOC5tSV+OF7Khsl
         2oapQMxdpXIPuu9WTGmyQiTjpLzV2x2slmmSjs3bUQimyo74UhiV2JnerkvvRpCGT0zK
         Y5A2SxoYHy4gQjSyXnFVmLOQEqEnDH1vRPjwQo943UDlzuwm4etBjA4EBt+7JMNDnKt5
         r/cxAuafn7wczBdXEQGAT8kgI32EssH4a1Fy9d/Kc/aSw7tirxmitwDk4Muc7qbn6g5+
         Hrdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jy9SO4cFNTeW57Ql4fj777Qkgz4i2H4c0hjXG1HACFo=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=EExudKaDHwgQB7X0PvKIX/foP55Y5nVVuGNs7s/nVqXu0FNTiFgWwVyD5Cb40XZ1Hb
         pRppS3Kto4m/TS7EcS/8nLbr1Uakf9LtWxI4Wi59QGDL+gV2JTxzK4nxyL3e7qllVjCD
         4K0TRJIgENSX+hZ5aanapEpDCzT+dhYWXDbA9amRYpjlMjEh8evEjqSZnxQ8zKmXt3ym
         dU+iran41i/As77080EruaBrYCF2W2dgcjUavMuRQy1uANxjL6rRz4SlRNOFp5yp42ge
         kGSn0InJBZR7Hq0y9gGWpuKDfom/XZilgnd7woC0GwgWR9CTrSBzGEyXp8aksulPI0eg
         cGKQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255915; x=1700860715;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy9SO4cFNTeW57Ql4fj777Qkgz4i2H4c0hjXG1HACFo=;
        b=AZq1hW0BVGwe4onjUbjDvyZhrxrL9rL3I2t5VcZCCwPzCXIP7RguStl/zaA3glpur0
         bnNMpWcyfVbL6UAr94MZnAkKT0CEf4g9gcArE0nJHUKMuPLF2lkDz9dB89o9Jui3nS8R
         lNVETUdcev1HbifqrD/YKOVswXSCkLt74O8FGTm41oCTz8oVoXHXc3eurQo1m0WupJrZ
         efl12oont7nMXjyucLlWAn6rRop+voq6GgevYJXxVW0TTGRz0DMBnCAQR/V6x2zf8NT1
         JDYVAgJJ3GpAphOJb+PScxHAmGJxZEdqUISQ4AT16yb0Vx+yh8Rrwvl7cVAh1qDt7Beh
         IkOA==
X-Gm-Message-State: AOJu0YzSpIx/KNCnvJ02hHdhNPk1fMklP1CfnuzZsva1rWp7czLJlaEh
	HydkZVRvmu5UjmUjgsJiIB3q3A==
X-Google-Smtp-Source: AGHT+IExqUy5HHt9P6MWAQp3Dadp+C66EFRgLbTWmwB/wIpS/YCQV3E1Dt9KwsWZiY+XQvz7/PYkkg==
X-Received: by 2002:a05:6870:c06:b0:1f4:d208:ab4e with SMTP id le6-20020a0568700c0600b001f4d208ab4emr567926oab.39.1700255915066;
        Fri, 17 Nov 2023 13:18:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:9d82:b0:1e1:5989:cb9f with SMTP id
 pv2-20020a0568709d8200b001e15989cb9fls3225745oab.2.-pod-prod-04-us; Fri, 17
 Nov 2023 13:18:34 -0800 (PST)
X-Received: by 2002:a05:6358:63a2:b0:16b:7964:90e6 with SMTP id k34-20020a05635863a200b0016b796490e6mr480001rwh.3.1700255914445;
        Fri, 17 Nov 2023 13:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255914; cv=none;
        d=google.com; s=arc-20160816;
        b=VQS+afqjOzq+fk6gr9RHZwHHEdegddbvLKAsruMFR2lQTNyGS1Q26s8CBYPVoPM7Yu
         USbJj+Fjh5p4RatgDhe4U+pJ3bjM29/YAaRaqBdZdJJJAr1skYQVm/2YINathev07QIG
         xJ7iPJ+jFzImsP5Sudk+0kEDh6OlJq3InFRfhfSkyD3EsMr85HAeuUk8dtaJXZLlJRno
         /f0K6RHRePKRzYypqgVZTXV9m7tYPSpQceJf1pZnUEBv6ap+SmPrg2J4A7WhEg3eUh+y
         pKLhN0stkaz9LE4BiJMVk1W0SwoNIpkgqo9H3o3EsceT+0jt1XO6f63+IY7A/iMIO2V/
         uGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lr+2x0KwBOZEsditfYiGs6AJLLCWZ6zNWlFkfokEznY=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=lWu1WwNe2E6acxpxAH8u+1pCslRYe0d/LBuLdggmrqqd+UjJTCEy7n87JDIZR2yHyp
         ZDZyCcJDX/lvtfmiSOQBGbsYzRKmg7i5nRx2Etx46Yhoz1a+6KTFeUVBjwF1EY9B+abT
         p9UWXjJb79xlZzROjAzqDqcBX570MNRldTqCgKVglqHhPRS+lGKgvt9pYE2PxbWS6nSE
         VSKJK8zmeP2lrKciiE0GxfpUE2NyRHN1bBJbQUYlhnXE+UENm6lEvgKOeA7Q+/iGRFq2
         SQNNil3oEu0KZ4XJwoSzIh4OFeVT3yKktzwcdw7LXAJgt7S/l9RoEWhGsGbG/feOyl0g
         o9ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id i11-20020a0cfccb000000b0065b26265ae5si2402278qvq.490.2023.11.17.13.18.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-4yRXWzp2Oi6o_Gk_bHqt-w-1; Fri,
 17 Nov 2023 16:18:32 -0500
X-MC-Unique: 4yRXWzp2Oi6o_Gk_bHqt-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A21D21C068DF
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9EEBDC15882; Fri, 17 Nov 2023 21:18:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F169C15881;
	Fri, 17 Nov 2023 21:18:29 +0000 (UTC)
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
Subject: [PATCH v2 42/51] cifs: Share server EOF pos with netfslib
Date: Fri, 17 Nov 2023 21:15:34 +0000
Message-ID: <20231117211544.1740466-43-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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
 fs/smb/client/cifsfs.c   |  2 +-
 fs/smb/client/cifsglob.h |  1 -
 fs/smb/client/file.c     |  8 ++++----
 fs/smb/client/inode.c    |  6 +++---
 fs/smb/client/smb2ops.c  | 10 +++++-----
 5 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index ea3a7a668b45..c7d8251c28d5 100644
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
index 0f74aa12e6b6..94f2411861d0 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1531,7 +1531,6 @@ struct cifsInodeInfo {
 	spinlock_t writers_lock;
 	unsigned int writers;		/* Number of writers on this inode */
 	unsigned long time;		/* jiffies of last update of inode */
-	u64  server_eof;		/* current file size on server -- protected by i_lock */
 	u64  uniqueid;			/* server inode number */
 	u64  createtime;		/* creation time on server */
 	__u8 lease_key[SMB2_LEASE_KEY_SIZE];	/* lease key for this inode */
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 8c9e33efb9a9..385830b02e0a 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2118,8 +2118,8 @@ cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
 {
 	loff_t end_of_write = offset + bytes_written;
 
-	if (end_of_write > cifsi->server_eof)
-		cifsi->server_eof = end_of_write;
+	if (end_of_write > cifsi->netfs.remote_i_size)
+		netfs_resize_file(&cifsi->netfs, end_of_write);
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
index 86fbd3f847d6..500c8104786d 100644
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
@@ -2779,7 +2779,7 @@ cifs_set_file_size(struct inode *inode, struct iattr *attrs,
 
 set_size_out:
 	if (rc == 0) {
-		cifsInode->server_eof = attrs->ia_size;
+		netfs_resize_file(&cifsInode->netfs, attrs->ia_size);
 		cifs_setsize(inode, attrs->ia_size);
 		/*
 		 * i_blocks is not related to (i_size / i_blksize), but instead
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index ae0acf9c411d..bd978544d857 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -3562,7 +3562,7 @@ static long smb3_simple_falloc(struct file *file, struct cifs_tcon *tcon,
 		rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 				  cfile->fid.volatile_fid, cfile->pid, &eof);
 		if (rc == 0) {
-			cifsi->server_eof = off + len;
+			netfs_resize_file(&cifsi->netfs, off + len);
 			cifs_setsize(inode, off + len);
 			cifs_truncate_page(inode->i_mapping, inode->i_size);
 			truncate_setsize(inode, off + len);
@@ -3654,8 +3654,8 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 	int rc;
 	unsigned int xid;
 	struct inode *inode = file_inode(file);
-	struct cifsFileInfo *cfile = file->private_data;
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
+	struct cifsFileInfo *cfile = file->private_data;
 	__le64 eof;
 	loff_t old_eof;
 
@@ -3690,9 +3690,9 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 
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
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

