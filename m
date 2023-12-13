Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEU246VQMGQEBNFRTDA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411081166D
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:11 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-58d53348a03sf8526858eaf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481170; cv=pass;
        d=google.com; s=arc-20160816;
        b=bPsSmojmRM987JF5vhNC3FpUyEyv/rwzY1KRqmFiUikSagANnPlcYrGcAdulE2Ux0X
         3inSQx0hnnF8P5/ms3buLPCcT6OqF1Ok8HkOROifRNWbVoeqFumBwGydwH+RvwPWy3H8
         vxYmGBRqpt9fkaWScpiPEg44SxEyKbdpLL6m0tEyhvrSq6E38alVNgLm4WIRxEODf1av
         gAb1x2VRia5GXFD5vOFXyvEuIjcm3j3VNQoSbFGtyi8BxQ6a+kiwJXeuHHLUBrtfXs40
         BZ1DhqMxy4Ty40t/cHUQCQq4cMMVsvR1t4f4I+u2rXpM1CezGt3PJH6jiDGU3xAfHiA6
         g8xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3aTkRg0DPwu4PVISQUGMqg/3RIYNnTXsy19sWNGeBVc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=f4GXDq4vPC102m8XPg9LCwuPn/w2fCNngjzUpeJfMyZ2d9eNSp5ofDy7WRZK3Su3XR
         tW2zX45vI+/RvS3KP/ru4V/Z2WA9aFvuD772aUgmM9gFlpcpl3RuKD8cZsrIVIrqUcWC
         6Hm1a8xE7wZFVe01r/xXdyQWrggc0iiEj5mpAxKDA+fiuzkVo14kwo83I5IHDzESDdpG
         l8+iEsv+SfKh7popAElbC9oN+MIbmDY6kyXxxbJXWjUs/Ik7yFs4fxpNkn4BGMarTSQp
         gGC+bFXRPtB63yjFNTB8mLLSiU/czjZGh0LUoDPozM+P8zh6qik9gcWEU4GMQzN5tPi6
         +ibA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481170; x=1703085970;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aTkRg0DPwu4PVISQUGMqg/3RIYNnTXsy19sWNGeBVc=;
        b=Q24BdmHkFwzC0/cX0bJtxcjyJqXTFFkXDOGxnyn8VQOYc29L+vHMHNQqdOB0kRQMYe
         kdfbNNLMYIdlWTJ+P6XYEfvWSJA3SMVQR0eTyS+EERM+P6aZf3NWd4HXJJop9ukfF9ZU
         DziJqDxreY29eORiZlte5JJN53mhvd7H98DUxedVxaCX/9daX71dh5c3raA4HiA+Rhuv
         sZhZouuD4ipDcfrDH3YQjRy81K5Z6c4UuXz06AvVglFDFfkFs71h5xQMIFyk8F17e9WU
         LRi9aTi1hodtz2dLGWYhZM8SAcA+uUlH25eUaO1r8mBpIRF3bzKTEMNKOCkF3w9409yo
         NUWw==
X-Gm-Message-State: AOJu0Yx1teoOcwqKkHyL74jdyTPeiRoWZAN2SYFgYp/7Jv9M6sn4USJJ
	s7XClsEFLGRM8Hp6o+yGtJbtPg==
X-Google-Smtp-Source: AGHT+IGvETjip0NoiXy4+bJF2U1M5N7FcKY1a63Yp7R7OlWNKtD1HOuG5KH5itkHJoLJyb8i0qvNGA==
X-Received: by 2002:a05:6871:2b0b:b0:1fb:75a:c432 with SMTP id dr11-20020a0568712b0b00b001fb075ac432mr8249796oac.91.1702481170148;
        Wed, 13 Dec 2023 07:26:10 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:f904:0:b0:67f:1f7:1f14 with SMTP id v4-20020a0cf904000000b0067f01f71f14ls236513qvn.1.-pod-prod-03-us;
 Wed, 13 Dec 2023 07:26:09 -0800 (PST)
X-Received: by 2002:ad4:5dc3:0:b0:67f:476:d17e with SMTP id m3-20020ad45dc3000000b0067f0476d17emr143256qvh.9.1702481169445;
        Wed, 13 Dec 2023 07:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481169; cv=none;
        d=google.com; s=arc-20160816;
        b=NF4ZB8OrXXeO8DNZT91Yx4R1uRYypBFTkWXhR0CE+GCc+orM1L/QNYAZ6w/IWK7pyN
         a17CraNgyNw1Qw220Ynw2tzmCxw4eF0LrZsdGCw+P24Yp+ENlTwOUE+l8r0ostdJwYmU
         6p5I9udfIYUpir13uJeEdZvb5H0qd1+N4hwP+6WNvgrIuw1I6rFCpE/mIMjUP/CQE5l/
         flZ64IGJph5CtecjpWwxCUclciVzMW6+KhT8GS9J5nI4FZwWXT1j9AEPmZ3U1RtXGVRv
         CvGdF+tFvFMiNx4YKERRNEar8sKDwsmgoOeWR5X3Ok6bEqKOC+7Ws7BI6u7RFaq309rk
         eADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=bK45Roxm3IC/nkVEsH43k2qGwF+l+q9rJ2GGBczBW+0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=JWEtmIKKv53/7i8qlBVc4fYeU0lkOvac5mSbuxK1n/o4qjMV+W/4JlFTrhKSTGBFgm
         nM80UAWN7dLIIU7Kx/BsNRtiOJDiOwZXA0c4KFOj4fSRR3J27W/vwyoMnPyd1yyS+IIx
         aoqiLV2RY8yIZ7QrB654Y8Y6tJX795pTIWaBVX1JItlDYONGx6BsViKYvceW1I3PHIHD
         MJJV+kCD9UiCz/264oXRsYLJXoyoFWw/OR/w5posfNQzMClBuzqB5kQHY4HPWbBJWH2q
         7VXZpjl4MzGJYEu4jJFtaWXEx3I2aMXvy3QCfW/L/NKmuofwiVFI7hDhf+l8//z2pMfS
         qtLg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e20-20020ad442b4000000b0067ad8f2d4b7si13418018qvr.287.2023.12.13.07.26.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-SxJzy8XXNjScmQg0uW8bkw-1; Wed, 13 Dec 2023 10:26:07 -0500
X-MC-Unique: SxJzy8XXNjScmQg0uW8bkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A7FD8828C9
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 37431112131D; Wed, 13 Dec 2023 15:26:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 937E41121312;
	Wed, 13 Dec 2023 15:26:03 +0000 (UTC)
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
Subject: [PATCH v4 30/39] netfs: Implement buffered write API
Date: Wed, 13 Dec 2023 15:23:40 +0000
Message-ID: <20231213152350.431591-31-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
cc: Jeff Layton <jlayton@kernel.org>
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
index 00c87f4e809c..702b864a4993 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -385,7 +385,10 @@ ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
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

