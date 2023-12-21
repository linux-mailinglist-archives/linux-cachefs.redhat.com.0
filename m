Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4XZSCWAMGQEHUQIWSI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB981B77D
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:11 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-425f8005cb8sf957021cf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165170; cv=pass;
        d=google.com; s=arc-20160816;
        b=DFYMv1AEx3l5HWtK4ZdQLMzvSvnpAto7YpIPPS0sxbMCV3LdOfwoXjmEFWACoBM7u3
         j8YBR4cbHcwEyB4iQg5qh7nxUpQ7AWJiJhajT9mAOd6g0y5QbrdPI8BcO+xuPC5XXraw
         11empJ85OhufB3lwHnNNcICNqcradRjiRIbsZtSrStZ2jvV7al3F/VbY4ZklpgwXwMUK
         QLCpWd/io9VL7A6qr3tv6SnujD3Z7KD0/J1x/ElX5c+lwIqp8DeVzOHkJo4U/egVaQfx
         AMVex41dvOLraNYl7q07XGXdD/HKS6FiCE80MRbaJaNUV0NUWrdxcvGWwAXJSZXSvupD
         3+Qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Qo2GFtjI/EDFI3YVWOt78fBvva+og/aWRDUj7zYkOVg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=AXjjyZ4m4ZZEe9D/KH5CkOGJdl/foSjPww1yaaTioqAuDw6xQ0vudJLVrk02cIDq5s
         Kjvu39m/JMH1YEh2DULTZOfOVu8t8SR5C7zdY1jBXggGrLoWSsjRnpiELtq0uegFLJOF
         SnQs+ooQyg0Bkl2P7lyMUlf5vcfyjnYDUVk07uv9r16jacyySvy5Vf+So8QibVbFXSDQ
         i6RY5MSiQGHeQm3gMbcoROxpowL5uozitwpdnl1c7DlRkljUjQjXijd6jrz4udAyDNc2
         B8Uk1G/Nm56qaOrRTa3PHsxW0YlfM7nPIhfsCqSa7jy+6Bx8I35Km1KGhtzaPTUN3xEa
         92ww==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165170; x=1703769970;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qo2GFtjI/EDFI3YVWOt78fBvva+og/aWRDUj7zYkOVg=;
        b=YIAE0BRupDHcgTR5T1I4bD/kIhZ/2Avuh6CS5HLQpN6+88zNrh/wesklxNIaQRv0Ke
         I59xg3nBCtG9XArw5exmc+ZCQ0fwFZ3Ek52pjRVrRWug50+mSBpI8UDWhimXaUglbfEB
         GMcbno24COCCneuHzjE+4MwVooYmxbCZspmSHe/uBGmEFkzMp6mjXGqO3LVcUq+tQWVe
         6G3ZtL5xaF+rhIWtslVoU0FQSVsihjuJhbjhesrRCtO/1szMOUwooiDh2OfkUJDNMYxw
         8w9qftNbaZ9LfB8I5yWAnIJkXtMZUbm+2c2l3AeI27HxVDu51M/Yxntmo4eWF3ulXqT7
         S/LA==
X-Gm-Message-State: AOJu0Yz17Rah34kweUr7fRX/1PdSTkWi9N7ya6+r3wlj+DvY6FqbnKwK
	CNsjs1/i44IFo7mFEj3JcAig3w==
X-Google-Smtp-Source: AGHT+IE1xBAZHEIHEV+rsoQM2cOqojTD0SJS3cZngI5YyJmJAMtWYJehxFnuj9fmCDVxSsZ1IMUZBw==
X-Received: by 2002:a05:622a:1a0a:b0:427:8675:9a53 with SMTP id f10-20020a05622a1a0a00b0042786759a53mr5891121qtb.6.1703165170194;
        Thu, 21 Dec 2023 05:26:10 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5242:0:b0:423:a0d4:8c4a with SMTP id y2-20020ac85242000000b00423a0d48c4als1029464qtn.0.-pod-prod-03-us;
 Thu, 21 Dec 2023 05:26:09 -0800 (PST)
X-Received: by 2002:a05:620a:147a:b0:77d:9af8:2a3b with SMTP id j26-20020a05620a147a00b0077d9af82a3bmr20558550qkl.18.1703165169589;
        Thu, 21 Dec 2023 05:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165169; cv=none;
        d=google.com; s=arc-20160816;
        b=XGbuHkLHC3XoFagVOXYibNjZvAbV9AhJcGFz7KJbEROObVqbog2QLMovLsXdC4Xx3c
         fVPUhxEhdMvwr9IhpWGYfwirCnDHmvuE0JYhKN+Rj53hLmwGNuMkclCuvY33citjDv9N
         +nsLUn70LIL+6tIHqxsznsObhSsl7nrWid5LwEpGGUwlKIuep/C4fcUZToeLJ1wU1GnI
         qZacMaK/Lbh6lONIou3/yKtXAgZVOChemCeioHg1eReng1oiljRVKc5YqJAS8XCB6FZk
         ZqI682BbpGlaMjKLi7TgA5l4+kglaF5OE6WG/xoODcFp+YsMJtszdEHiQRJvn3aTKyp6
         7y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MXyYddG/H4NtJwEG9O1cQV6BiNM35TAGFP5Wf/FnDYI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=VydQpCD2Wp1el7sp5ib4XHFD8b3sZLaoTUuEo/aCpeuEtHMimzkZTxqGKwspiN6mtq
         Ih7zYb3TN9IAqazb1IsJPibG4tCg5NYyhS/T7Io0M/jKyBNGSro2Y0R1/qYAqpZYUtfv
         MH1Bn4Pe+qNpZ5Mnp1X29T226MK1tfKz3T5YkDTJk9zYVNRFOZnUKW9URcltSWPD+g8x
         qR/GC62X8dITjgox5AGasFG5WQbozKFH0FJX6GROxKeJ9dWg1wl4+e++7JsMCO4jzX7i
         TyI83ed5wP9YT6okelQ81GbVsIXhfbq+2udFlF8OCxEqb66pLHz6qPAw/K8L6xx+2x2B
         4Jpg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id qr16-20020a05620a391000b007777245ad07si2203698qkn.480.2023.12.21.05.26.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:09 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-tUbqtQ7ZMQGI0p8v8Utyng-1; Thu,
 21 Dec 2023 08:26:07 -0500
X-MC-Unique: tUbqtQ7ZMQGI0p8v8Utyng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 856D5383008C
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8076CC1596E; Thu, 21 Dec 2023 13:26:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 800F2C159B0;
	Thu, 21 Dec 2023 13:26:04 +0000 (UTC)
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
Subject: [PATCH v5 32/40] netfs: Provide netfs_file_read_iter()
Date: Thu, 21 Dec 2023 13:23:27 +0000
Message-ID: <20231221132400.1601991-33-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Provide a top-level-ish function that can be pointed to directly by
->read_iter file op.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c | 73 ++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h    |  2 ++
 2 files changed, 75 insertions(+)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 950f63fc156a..a59e7b2edaac 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -558,3 +558,76 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	_leave(" = %d", ret);
 	return ret;
 }
+
+/**
+ * netfs_buffered_read_iter - Filesystem buffered I/O read routine
+ * @iocb: kernel I/O control block
+ * @iter: destination for the data read
+ *
+ * This is the ->read_iter() routine for all filesystems that can use the page
+ * cache directly.
+ *
+ * The IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN shall be
+ * returned when no data can be read without waiting for I/O requests to
+ * complete; it doesn't prevent readahead.
+ *
+ * The IOCB_NOIO flag in iocb->ki_flags indicates that no new I/O requests
+ * shall be made for the read or for readahead.  When no data can be read,
+ * -EAGAIN shall be returned.  When readahead would be triggered, a partial,
+ * possibly empty read shall be returned.
+ *
+ * Return:
+ * * number of bytes copied, even for partial reads
+ * * negative error code (or 0 if IOCB_NOIO) if nothing was read
+ */
+ssize_t netfs_buffered_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct netfs_inode *ictx = netfs_inode(inode);
+	ssize_t ret;
+
+	if (WARN_ON_ONCE((iocb->ki_flags & IOCB_DIRECT) ||
+			 test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags)))
+		return -EINVAL;
+
+	ret = netfs_start_io_read(inode);
+	if (ret == 0) {
+		ret = filemap_read(iocb, iter, 0);
+		netfs_end_io_read(inode);
+	}
+	return ret;
+}
+EXPORT_SYMBOL(netfs_buffered_read_iter);
+
+/**
+ * netfs_file_read_iter - Generic filesystem read routine
+ * @iocb: kernel I/O control block
+ * @iter: destination for the data read
+ *
+ * This is the ->read_iter() routine for all filesystems that can use the page
+ * cache directly.
+ *
+ * The IOCB_NOWAIT flag in iocb->ki_flags indicates that -EAGAIN shall be
+ * returned when no data can be read without waiting for I/O requests to
+ * complete; it doesn't prevent readahead.
+ *
+ * The IOCB_NOIO flag in iocb->ki_flags indicates that no new I/O requests
+ * shall be made for the read or for readahead.  When no data can be read,
+ * -EAGAIN shall be returned.  When readahead would be triggered, a partial,
+ * possibly empty read shall be returned.
+ *
+ * Return:
+ * * number of bytes copied, even for partial reads
+ * * negative error code (or 0 if IOCB_NOIO) if nothing was read
+ */
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct netfs_inode *ictx = netfs_inode(iocb->ki_filp->f_mapping->host);
+
+	if ((iocb->ki_flags & IOCB_DIRECT) ||
+	    test_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags))
+		return netfs_unbuffered_read_iter(iocb, iter);
+
+	return netfs_buffered_read_iter(iocb, iter);
+}
+EXPORT_SYMBOL(netfs_file_read_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index e444f814dd56..a2e53ab06a1b 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -379,6 +379,8 @@ struct netfs_cache_ops {
 
 /* High-level read API. */
 ssize_t netfs_unbuffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_buffered_read_iter(struct kiocb *iocb, struct iov_iter *iter);
+ssize_t netfs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 
 /* High-level write API */
 ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

