Return-Path: <linux-cachefs+bncBDLIXLMFVAERBDNR36VAMGQEPTUQ4WI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D27EF9C0
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:06 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-66d0b251a6asf29200766d6.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255886; cv=pass;
        d=google.com; s=arc-20160816;
        b=DvROwBHfV8ruQvSIp2+SfKqiAss0qLnmgI2vxRbY5XDchX63JktY6iYRFQRi9QlvUQ
         eaubH65T9LCSpu7PDxsKcu1QZQyQstTiGhR1BByWFHq6wbH0gYdAlh3L38n7SQjAssPD
         Y7N2dAhIUiqThe5Y1aCb5T+XQ6boGll0vOQXRHL1Q7hm3XSVRcqmCLiD5nck4wifuYOY
         TCwkLo/eXBb4XdkWIbcAYbzAuGpjCD1Tx5TTz9WEy8HiKhzW2aCewmieDYJ0PbWpjg+9
         5S1GzMvBPd9pgSK47SjmnoCj6PhsWARAZBqVR/Z7Sy11iJpfSxUY2uYq/xONP9Hglc3/
         xIqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=khFZ5JHDjSZAgGQLTbdADoHvIKCSo3pebl4WPM6Jje4=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=POOmb4ccFxFKS+22NBigmdPeOcHDcMkNnzkfsMyUcPUtVa9MgLCnf1vuHXl2Ls9qrO
         FEvRwXshMlZWbtGgwThNDGaxd6y/gyhTqAs9LlJRIUH+l+RKL0orT/ScRWQ8WLgnW6Uj
         +UDiF39n68QcmTtYfo/JDbbB+rEOi/wY9j7QPh3c7fgIjXlX7z5DtAzlCC3B2zxv2r9p
         7uC46PB9o//IvGlL97yp2RwdgsF84EDCo1i6R4TXoFOY7s/CzUyXa2tF8iwap4YdxGuT
         FnPFff8vPYJ2ccAuHybLZkD8/+fMIl1FFIj4fRBQldbNNwslykIggxYojc0eQc+V9Smu
         eDDw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255886; x=1700860686;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khFZ5JHDjSZAgGQLTbdADoHvIKCSo3pebl4WPM6Jje4=;
        b=MUJx5Zs5SWzl9P1cDNt8n6YhecTWVYLVBwYl+upfhmPHQEWUNJLE4GDwIsf4h5kUAZ
         nCB4TYzmW6bARyaPPEYmTn2RRUK78S+mN5NWjgHE8NL5nzGsXgIdMwTV2topL5E0DUnW
         ZnCrW+6bawxgGxFVBbUvilibeoFptwxfjJ5n7bE3x65H+6KZCH0rJk3HuRwm7iXrW9EC
         w+D0JO+46oaedB85xE0ZlgGonFahbzRPnynLaZ1zqvh00gP6mcIzc4RIgwpgMLc1w0W/
         il3pZDWRTRPpWnf1XouiMyRxrIMifqkoD9pMsrhnp/Xb+aBfr9DXrK3Rgh17DjfH2fQV
         UzOA==
X-Gm-Message-State: AOJu0Yz4OKdxM4pypndX2n5Ysh6qAPtsu7iTk9BznjXx7RYw7noQtHkF
	k4ym3j5MiR7aEvnINBQbrEeUVQ==
X-Google-Smtp-Source: AGHT+IERgvYJpNxibj3s1RNm6Cgrtw6Ko9b98aB521QAxfIbatk/i8E0E1DOcGzmxW0si0iv4m6rwQ==
X-Received: by 2002:a05:6214:21aa:b0:677:f830:83f0 with SMTP id t10-20020a05621421aa00b00677f83083f0mr380517qvc.8.1700255885978;
        Fri, 17 Nov 2023 13:18:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e844:0:b0:670:a1c0:e4e2 with SMTP id l4-20020a0ce844000000b00670a1c0e4e2ls1772734qvo.1.-pod-prod-04-us;
 Fri, 17 Nov 2023 13:18:05 -0800 (PST)
X-Received: by 2002:ad4:5c6b:0:b0:670:9cc7:2f03 with SMTP id i11-20020ad45c6b000000b006709cc72f03mr387998qvh.43.1700255885415;
        Fri, 17 Nov 2023 13:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255885; cv=none;
        d=google.com; s=arc-20160816;
        b=hB5yinO/i+eBWdmXlLljbC80Rt/plwqh5koDbzzFZaTE+eoPzHFGWcHohxtO++X9yC
         j0u4ILYg7rYtJWcADoCqMmZwjhDldES7HOc0RfyTsyQFRU5RExcKkqNYLm7Afzg88SP6
         EbsM3uKhHvEmnWeutQESaGRUzbIhS9v2bw/ihtraiPvw/LNbPN2Ti4OYHhzUP4bk3wq0
         X0/KDnui/tfXOBxI76xADc7UtDuK8vAFejvjEgK71DV0goD/eJQAlN8tvkRhLjL8YjqN
         DWKwQbi9bhxzwYJtBjs5yxkU9oEClykZnqWVbPB/OCIfRBuVy1ZH3rej+YFsxPdDj4bG
         1ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PmfXBVlMsm2chMbQyKBBe8+lheiIqsV1CsACyw5IYTE=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=DBOUND1USdBv+1vnY7CniFyoJkBgo8J2UFOZGMZwp79Tab65Q4xxDeXfNEWmMnZr8G
         +GY/nIX/m94S7gIajJxWfCZzYJfoUdNzXQCdsphAE02tBTbXGZLF6XTcJa7AeJFFUorr
         QJphnSBAhIoxE24wvZlvcLF+pBevnXBQTHPRug0LBcX0L3o357W5hN3iyhR3UAGghndZ
         UMeiRAALjhDjjzlJVZnjm9YshE+HrSB2qkkDpTlhWvmbXkXvU06gUlxvIk3UwzFDvykJ
         wm/UL4HziIeIK5YRbZ6i6n7fAk4EDqiZ16jFRb+PnGj8lgwgAFlZUlmaEXNT/7WTyKQ5
         DSEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id q7-20020ad44027000000b0066d3111e5b7si2309148qvp.442.2023.11.17.13.18.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:05 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-8xt8a_doPT-Ulfni-g2ozw-1; Fri, 17 Nov 2023 16:18:03 -0500
X-MC-Unique: 8xt8a_doPT-Ulfni-g2ozw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ED28101B045
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7BE5B10EA1; Fri, 17 Nov 2023 21:18:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBCAC5036;
	Fri, 17 Nov 2023 21:18:00 +0000 (UTC)
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
Subject: [PATCH v2 34/51] netfs: Decrypt encrypted content
Date: Fri, 17 Nov 2023 21:15:26 +0000
Message-ID: <20231117211544.1740466-35-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Implement a facility to provide decryption for encrypted content to a whole
read-request in one go (which might have been stitched together from
disparate sources with divisions that don't match page boundaries).

Note that this doesn't necessarily gain the best throughput if the crypto
block size is equal to or less than the size of a page (in which case we
might be better doing it as pages become read), but it will handle crypto
blocks larger than the size of a page.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/crypto.c            | 59 ++++++++++++++++++++++++++++++++++++
 fs/netfs/internal.h          |  1 +
 fs/netfs/io.c                |  6 +++-
 include/linux/netfs.h        |  3 ++
 include/trace/events/netfs.h |  2 ++
 5 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/crypto.c b/fs/netfs/crypto.c
index 943d01f430e2..6729bcda4f47 100644
--- a/fs/netfs/crypto.c
+++ b/fs/netfs/crypto.c
@@ -87,3 +87,62 @@ bool netfs_encrypt(struct netfs_io_request *wreq)
 	wreq->error = ret;
 	return false;
 }
+
+/*
+ * Decrypt the result of a read request.
+ */
+void netfs_decrypt(struct netfs_io_request *rreq)
+{
+	struct netfs_inode *ctx = netfs_inode(rreq->inode);
+	struct scatterlist source_sg[16], dest_sg[16];
+	unsigned int n_source;
+	size_t n, chunk, bsize = 1UL << ctx->crypto_bshift;
+	loff_t pos;
+	int ret;
+
+	trace_netfs_rreq(rreq, netfs_rreq_trace_decrypt);
+	if (rreq->start >= rreq->i_size)
+		return;
+
+	n = min_t(unsigned long long, rreq->len, rreq->i_size - rreq->start);
+
+	_debug("DECRYPT %llx-%llx f=%lx",
+	       rreq->start, rreq->start + n, rreq->flags);
+
+	pos = rreq->start;
+	for (; n > 0; n -= chunk, pos += chunk) {
+		chunk = min(n, bsize);
+
+		ret = netfs_iter_to_sglist(&rreq->io_iter, chunk,
+					   source_sg, ARRAY_SIZE(source_sg));
+		if (ret < 0)
+			goto error;
+		n_source = ret;
+
+		if (test_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags)) {
+			ret = ctx->ops->decrypt_block(rreq, pos, chunk,
+						      source_sg, n_source,
+						      source_sg, n_source);
+		} else {
+			ret = netfs_iter_to_sglist(&rreq->iter, chunk,
+						   dest_sg, ARRAY_SIZE(dest_sg));
+			if (ret < 0)
+				goto error;
+			ret = ctx->ops->decrypt_block(rreq, pos, chunk,
+						      source_sg, n_source,
+						      dest_sg, ret);
+		}
+
+		if (ret < 0)
+			goto error_failed;
+	}
+
+	return;
+
+error_failed:
+	trace_netfs_failure(rreq, NULL, ret, netfs_fail_decryption);
+error:
+	rreq->error = ret;
+	set_bit(NETFS_RREQ_FAILED, &rreq->flags);
+	return;
+}
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index d3e74ad478ce..fbecfd9b3174 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -26,6 +26,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
  * crypto.c
  */
 bool netfs_encrypt(struct netfs_io_request *wreq);
+void netfs_decrypt(struct netfs_io_request *rreq);
 
 /*
  * direct_write.c
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 36a3f720193a..9887b22e4cb3 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -398,6 +398,9 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 		return;
 	}
 
+	if (!test_bit(NETFS_RREQ_FAILED, &rreq->flags) &&
+	    test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags))
+		netfs_decrypt(rreq);
 	if (rreq->origin != NETFS_DIO_READ)
 		netfs_rreq_unlock_folios(rreq);
 	else
@@ -427,7 +430,8 @@ static void netfs_rreq_work(struct work_struct *work)
 static void netfs_rreq_terminated(struct netfs_io_request *rreq,
 				  bool was_async)
 {
-	if (test_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags) &&
+	if ((test_bit(NETFS_RREQ_INCOMPLETE_IO, &rreq->flags) ||
+	     test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) &&
 	    was_async) {
 		if (!queue_work(system_unbound_wq, &rreq->work))
 			BUG();
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 639f1f9cb7e0..364361cc93be 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -327,6 +327,9 @@ struct netfs_request_ops {
 	int (*encrypt_block)(struct netfs_io_request *wreq, loff_t pos, size_t len,
 			     struct scatterlist *source_sg, unsigned int n_source,
 			     struct scatterlist *dest_sg, unsigned int n_dest);
+	int (*decrypt_block)(struct netfs_io_request *rreq, loff_t pos, size_t len,
+			     struct scatterlist *source_sg, unsigned int n_source,
+			     struct scatterlist *dest_sg, unsigned int n_dest);
 };
 
 /*
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 70e2f9a48f24..2f35057602fa 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -40,6 +40,7 @@
 #define netfs_rreq_traces					\
 	EM(netfs_rreq_trace_assess,		"ASSESS ")	\
 	EM(netfs_rreq_trace_copy,		"COPY   ")	\
+	EM(netfs_rreq_trace_decrypt,		"DECRYPT")	\
 	EM(netfs_rreq_trace_done,		"DONE   ")	\
 	EM(netfs_rreq_trace_encrypt,		"ENCRYPT")	\
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
@@ -75,6 +76,7 @@
 #define netfs_failures							\
 	EM(netfs_fail_check_write_begin,	"check-write-begin")	\
 	EM(netfs_fail_copy_to_cache,		"copy-to-cache")	\
+	EM(netfs_fail_decryption,		"decryption")		\
 	EM(netfs_fail_dio_read_short,		"dio-read-short")	\
 	EM(netfs_fail_dio_read_zero,		"dio-read-zero")	\
 	EM(netfs_fail_encryption,		"encryption")		\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

