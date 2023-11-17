Return-Path: <linux-cachefs+bncBDLIXLMFVAERB5VQ36VAMGQE6VUWGYQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2387EF9AD
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:43 +0100 (CET)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6d644bf1dfdsf2302315a34.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255862; cv=pass;
        d=google.com; s=arc-20160816;
        b=PR4LON3NaAbLGmpej2GLGqCPnB6yYomoJ9MyIs/9EPcuOcFHtjf2t6vt9x2flE8dqc
         qqtlNt9086Pkdn79nOMFmvkwpTm7+EgrTe/+qZovlA63rWBry0kqEXawHxim4w/0mh8I
         SZpoxYYg33L9AICwF46M84T0Eng/uHJJczh9lzTbY/QdbQMp+58Tj0dYP3cJu3rStD1G
         +oTjdO3t9Rk/eRdtJsoPTgr8v8lSZRpiHd68I6QL6xm+tlXpMt+tt7YW/0YwnaKAfjM9
         /yw/0grN0dBxIKHhKD3WkF5JM5AOcFHVu9aiOvbeD5OdGxnsNVPUKjAUOea1IzQOz867
         H6MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=0CgBy1cejul/iOuGhXjLW7E+Ran5pSGZ/M4MUXUs8B0=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=s42b28D3KiUq8hrwNBZMeODBo5Fol24OBj+ERs7Pr5oNulbs3WWr2wQrMS5OyBsPNP
         Zz4225POw4wMZe++GhiDjYVA8KLHJ3cxWTCnvSHnt153W8Tg2S+PT4180mSyI7YY9LwQ
         YIdinRRvtEWNErQwdldRxXzvz3uwesMtRPLob31a3zH/lsGgyar/eLmds74DVVLWk3vA
         SaC+rnzsKvTal8JfRk99qnHA8IcSJ71NHyvGo7sIxWfGq9U2tqWn6JHcNwS9dGJ2WwNu
         XCr1urukN1ekzgMmqwyQerT8UCgVkqgsHIrhiuuFeXdPdvrxS13C1IEc/HtyqnAhpX8v
         cHcA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255862; x=1700860662;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CgBy1cejul/iOuGhXjLW7E+Ran5pSGZ/M4MUXUs8B0=;
        b=NxaifBhF+G5p+clkZrtOhznUcrM3I01MkTXbLrUOrBWKb3Ja3sjkWt8+Z6RNdHtlEi
         Q7S8/kKXFFgu7vMOJUcXqqt4sULyNHpS/v98vKB1OuZkY11jZY8jOn6q1fgqLU0xsp1z
         9TOiRVHFXDszttkZUGeHcHl+23M7vlpKdhk4c16QROlJtsMrrDOzK1C1ijsWrbwDx6tj
         cMgnbv+zMbq6Cuj6VPOScXuIfa/O9cmkPAg6rL1F08JZ+sTHUIh+YPIvV6+tigThaRfc
         tb9XD6R7+xpxmLkOZ7SGGNerA5MwVJ9RwixWNjWsgE+TDTxUW1WyxEiMc5JN0pQG43XJ
         W7/Q==
X-Gm-Message-State: AOJu0YxWz7cmbUJxo2XLZFzCw9DA4BE9SdZRE+GgkCiLjeiWPSUd/6Eb
	3clgQBQ2YyJDEJkPuEpVEiteoQ==
X-Google-Smtp-Source: AGHT+IHYKi2C9WC2NP2+AZEPHt8VLm4yaa/mY4Vwq3hZMG3DpL4SdIIvcnh4dcaxA8vTnzlgfIufXQ==
X-Received: by 2002:a05:6870:cd8d:b0:1f5:c6f2:27a2 with SMTP id xb13-20020a056870cd8d00b001f5c6f227a2mr464809oab.30.1700255862490;
        Fri, 17 Nov 2023 13:17:42 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a1b:b0:41c:c118:e752 with SMTP id
 f27-20020a05622a1a1b00b0041cc118e752ls575087qtb.2.-pod-prod-05-us; Fri, 17
 Nov 2023 13:17:42 -0800 (PST)
X-Received: by 2002:ad4:5ce9:0:b0:675:5924:ef69 with SMTP id iv9-20020ad45ce9000000b006755924ef69mr312851qvb.32.1700255861913;
        Fri, 17 Nov 2023 13:17:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255861; cv=none;
        d=google.com; s=arc-20160816;
        b=RLBeFdVrELr1rlScW3y8GycqpcvguYObIRzuRjoCBUVnqK50GwaJJo1IHjZf8EMBtL
         88pryllrUrIIkWNxjZMrpaBhqjPidhMcjYAYsQx37NvA76EeZH0bLc7NjSTcxSHBNVz/
         cAVYd4M8fHtQrFcJmzbx1qgs8IPWruZ8/YcurmQfcNK9c7qHlB5YV9Oj8Omhz/hMIqLj
         MyaRYNbYlVW94jmLl1RN8P3Wl7GeBxa6059j0LF2ria5ihphpt2794IOsSosAknYXKB/
         P5VvAopBMamVReGNLZACvpNYLZPcSh0s33L6DZLhm/da9dhKFWF7KqDG1wgJRbY4s6+r
         KvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GawAUyJ9iP0gj2PbHUjDCEhyVAdgsUqdjSUQK91ytDA=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=HSAts2+L3jkShELwKSPA7feLR6aQ8zA5ZldGPRl2bhu3BvV8vyYAQLqev1a2TrR24L
         akfwzETM35+gQmg8bkG1LWhbNj4TpYcrUdFe6SPa6pivQGX1yodZM6BjU1jGR8Sxu3I7
         fN8yhCueBM9hSY1UTAvsgDD3edxINQzoISCuPYvH75WgfsVxoUTEisDoBsJ8HhFn38uY
         /1RTXoM9ASWk24poFqdVSgAcnRgEteCrp7mRdJS4JstEX5E1Gq9SwsParm5pC+hB1Q//
         +UofQyleRYTu0jbWc7UQMPF/G/L3UzdGtpBRA86eNHa1FgyctXADzWZp6BYOUPJINr6m
         PgwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id l10-20020ad44bca000000b0066d11085154si2309448qvw.565.2023.11.17.13.17.41
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:41 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-XZ3HkZHNMrWFCuUD27VKjg-1; Fri, 17 Nov 2023 16:17:40 -0500
X-MC-Unique: XZ3HkZHNMrWFCuUD27VKjg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0337B81B560
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id F3C20492BE8; Fri, 17 Nov 2023 21:17:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59660492BE0;
	Fri, 17 Nov 2023 21:17:37 +0000 (UTC)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 27/51] netfs: Implement buffered write API
Date: Fri, 17 Nov 2023 21:15:19 +0000
Message-ID: <20231117211544.1740466-28-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Institute a netfs write helper, netfs_file_write_iter(), to be pointed at
by the network filesystem ->write_iter() call.  Make it handled buffered
writes by calling the previously defined netfs_perform_write() to copy the
source data into the pagecache.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 83 +++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |  3 ++
 2 files changed, 86 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 4de6a12149e4..60e7da53cbd2 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -330,3 +330,86 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	goto out;
 }
 EXPORT_SYMBOL(netfs_perform_write);
+
+/**
+ * netfs_buffered_write_iter_locked - write data to a file
+ * @iocb:	IO state structure (file, offset, etc.)
+ * @from:	iov_iter with data to write
+ * @netfs_group: Grouping for dirty pages (eg. ceph snaps).
+ *
+ * This function does all the work needed for actually writing data to a
+ * file. It does all basic checks, removes SUID from the file, updates
+ * modification times and calls proper subroutines depending on whether we
+ * do direct IO or a standard buffered write.
+ *
+ * The caller must hold appropriate locks around this function and have called
+ * generic_write_checks() already.  The caller is also responsible for doing
+ * any necessary syncing afterwards.
+ *
+ * This function does *not* take care of syncing data in case of O_SYNC write.
+ * A caller has to handle it. This is mainly due to the fact that we want to
+ * avoid syncing under i_rwsem.
+ *
+ * Return:
+ * * number of bytes written, even for truncated writes
+ * * negative error code if no data has been written at all
+ */
+ssize_t netfs_buffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *from,
+					 struct netfs_group *netfs_group)
+{
+	struct file *file = iocb->ki_filp;
+	ssize_t ret;
+
+	trace_netfs_write_iter(iocb, from);
+
+	ret = file_remove_privs(file);
+	if (ret)
+		return ret;
+
+	ret = file_update_time(file);
+	if (ret)
+		return ret;
+
+	return netfs_perform_write(iocb, from, netfs_group);
+}
+EXPORT_SYMBOL(netfs_buffered_write_iter_locked);
+
+/**
+ * netfs_file_write_iter - write data to a file
+ * @iocb: IO state structure
+ * @from: iov_iter with data to write
+ *
+ * Perform a write to a file, writing into the pagecache if possible and doing
+ * an unbuffered write instead if not.
+ *
+ * Return:
+ * * Negative error code if no data has been written at all of
+ *   vfs_fsync_range() failed for a synchronous write
+ * * Number of bytes written, even for truncated writes
+ */
+ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file->f_mapping->host;
+	struct netfs_inode *ictx = netfs_inode(inode);
+	ssize_t ret;
+
+	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
+
+	if ((iocb->ki_flags & IOCB_DIRECT) ||
+	    test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags))
+		return netfs_unbuffered_write_iter(iocb, from);
+
+	ret = netfs_start_io_write(inode);
+	if (ret < 0)
+		return ret;
+
+	ret = generic_write_checks(iocb, from);
+	if (ret > 0)
+		ret = netfs_buffered_write_iter_locked(iocb, from, NULL);
+	netfs_end_io_write(inode);
+	if (ret > 0)
+		ret = generic_write_sync(iocb, ret);
+	return ret;
+}
+EXPORT_SYMBOL(netfs_file_write_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 4f9a46a21c28..4cdadd1ce328 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -389,7 +389,10 @@ ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 			    struct netfs_group *netfs_group);
+ssize_t netfs_buffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *from,
+					 struct netfs_group *netfs_group);
 ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from);
+ssize_t netfs_file_write_iter(struct kiocb *iocb, struct iov_iter *from);
 
 /* Address operations API */
 struct readahead_control;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

