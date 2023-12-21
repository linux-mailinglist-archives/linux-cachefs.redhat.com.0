Return-Path: <linux-cachefs+bncBDLIXLMFVAERB2XZSCWAMGQEJQUG2HI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EB081B779
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:03 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42784a3e560sf10858501cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165162; cv=pass;
        d=google.com; s=arc-20160816;
        b=iQC0dqjOtxrTeK6E/nHRJNFf7EsviHu25ihgl1U93xY4Ph7QRKj/gA7+wbgxLSmby/
         dkl38hST+u6FeIG0igTHyWeCCc+CbH4Ms9NMHceCSSvJzMdSShX59zxqSaNKI9E805bP
         UZi9C7dLMD6oW6nyD9nmC5H/PlK5Ux6RjbcBeOyqUSJpLeBkv2EQv6CApyATNCK87Fte
         z7bsWyCUN5tnnHLOwKFO08TT7gpI8zUhkeE64sVvqwYl2P7k28W2ZShU3xUhC3IEsZaF
         hxGAHE26RiBnExQU8u0hTOGWzHJeKY3mD+EHcICUam5tffCgn8/89MZFdzcjUQO6ZUtF
         Mmuw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=QkSNQxVNEBTI8yxkUbgN2XFFzjzf08qDN7prJes03ig=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=dt5/vojaiaXi9aiY4DkxTv59iGy2JdWvGJ7nvYAjZDZNk5bFwaQdwXRPQCakNu4hDv
         A2giK00igYF1uVmDtXtHa2fo/ZDycjkkjiaw55vx8GKiiw6jodLdmAzsq6T0faGTb9Im
         k5Yk76ksner+xy4B8jJTpHm12HE1jhkYNATfmGY4L1x2Ne34lIVQTk1BKkQ8OtLvsCQd
         x/Dj3GQ2JmJ/BXGJ5kmNnZ0wlTWZctn8PDmZSqCT0vfVo/k2uVpjwUBPqQuJf3hz0/El
         9aAzrzS00aUFnlSEfFcRwWLhHSzlgqrlvrYS5b+KGePqF1MLVsbA5suEsjRyLReNB8+6
         S/Hw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165162; x=1703769962;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkSNQxVNEBTI8yxkUbgN2XFFzjzf08qDN7prJes03ig=;
        b=dNmdrCGSK6WYcahbHZJ5FmJ9G7sUDQ6XY2hmQnBTPofQh7z0XAWy0UfA/dUvuSP9ZL
         d+MpADrAnev5tSoIOLSRWot9NIhL2hrLLrAZan4rnMGEnosU1YjW0ycbt+gL1DsADRXN
         i5SGMjrZ/dPtaLV1CiOiwe+5noNKJH9rImO/q3MQobkILyxEFhTWnR8zuM0/6h8xsq+L
         Solzdz7Aca9Kt7a3RdgIwBYBwdzXEtnQphMbEj/0lgIX8JJXAWrXdMNCD2fQ/wgV6FLi
         b8gLswsxQWaiW9/89ctpfBqvUljZCIoRwh/GRjb58C11S74YnlFWzAwikq0BfJIZOnm5
         QQ8w==
X-Gm-Message-State: AOJu0Ywpu+Oai3U1eSccxKtGlC8B8LqjqhQ+Jk6YxxdvTqQpYgG+4urG
	Ip14yXcRFSR3ORFVQjsxiL9Vig==
X-Google-Smtp-Source: AGHT+IFXHAW9l0Pvt+mJVfDbkruytO/VFMsbMKPgQ9Pw7HwMAqhpz0t/Ei1ZFhklhnlQMb90ljsK0g==
X-Received: by 2002:ac8:5f49:0:b0:425:9141:850 with SMTP id y9-20020ac85f49000000b0042591410850mr26738340qta.27.1703165162563;
        Thu, 21 Dec 2023 05:26:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5451:0:b0:423:b70e:f8f1 with SMTP id d17-20020ac85451000000b00423b70ef8f1ls1112316qtq.0.-pod-prod-05-us;
 Thu, 21 Dec 2023 05:26:02 -0800 (PST)
X-Received: by 2002:a05:622a:1043:b0:41c:d9e7:7782 with SMTP id f3-20020a05622a104300b0041cd9e77782mr29206562qte.68.1703165161925;
        Thu, 21 Dec 2023 05:26:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165161; cv=none;
        d=google.com; s=arc-20160816;
        b=sGxu4NbYlII67jVXJniBBYhmOaT+3tlbrL4ggkm0PSkzPwhMcSnfuaYsxZasGDCNf6
         H60r8Dv3PW7RNsDmJ9LRCekVR4A7Rz7MvZ6Wn8EizNbuFKJBL4eipS6ugD0UYWzoXQNw
         kMgxHg82G4+B7KSplQMVpJIglJiGVpG65i2Z3B9OWn81LSCc+aj6jacfwiy26TkuYMg9
         ehvwBnBkj5a/C1oYI8RvwgqaJwS4eJmY/mSfThKALErob1uc+6Bo1OTRQLip2YobRvbC
         2tx9sON6ULsXulnfzOAQPMAt5B+CV0SdLnZEfdAXg69IPpnFrAAGJTR5E1HZGeaIhcIh
         58xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=qEJ3eZa3LfaF+kEIU1Z7rEkg/roQPuUXyuzSmmW4J9g=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=jv7DiFQD9StvT94VrhFq3oHM0I8fjrGnazBWR/iLf2NwRuzWFAU8kfBIsGvvz0su+k
         ODFdN8FsgYoELO/lgtBoS2fPEGHB7KTw+wdiLwcri+/OGhVO/FT6C9gY/MUudImEvWqz
         d+DN5pqGGLgbKE8dUyHTkyImYywdzSTHFSzzAyVsMeG+5AG7IvKtqgdcwpo0tqvPIPza
         F7XzaTzYHGELinnOevuoKD+K8Eidvs0TpLlCEuXS3ZfHBZCUI/DvIhtlSX5Ug9Rxexn/
         SLAwRXJx5/CMz/jNE+uFPTuxJcvp3OPSo5jhBZOqtCgzY4QXYGUAphLxYj5nKW30IXv8
         LnkA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z8-20020a05622a060800b004254b598f13si2113332qta.76.2023.12.21.05.26.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-f8ndS2_cMHqnEf-DHodU0g-1; Thu, 21 Dec 2023 08:26:00 -0500
X-MC-Unique: f8ndS2_cMHqnEf-DHodU0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19C4785A588
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 133BF1C060B2; Thu, 21 Dec 2023 13:26:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 276401C060B1;
	Thu, 21 Dec 2023 13:25:57 +0000 (UTC)
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
	Eric Van Hensbergen <ericvh@kernel.org>,
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
Subject: [PATCH v5 30/40] netfs: Implement buffered write API
Date: Thu, 21 Dec 2023 13:23:25 +0000
Message-ID: <20231221132400.1601991-31-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 83 +++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h     |  3 ++
 2 files changed, 86 insertions(+)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index b76688e98f81..f244123ab568 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -333,3 +333,86 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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
index 47efa8596527..5c225f308704 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -383,7 +383,10 @@ ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
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

