Return-Path: <linux-cachefs+bncBDLIXLMFVAERBCHQZCVQMGQET3OCWAI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08780938A
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:26 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4254409870fsf16109911cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984265; cv=pass;
        d=google.com; s=arc-20160816;
        b=dhr1C7C4HM17Wg8JMEsFPAU+HrUCg6OPF3WcLAnmx4n8VAhpOOt9urNoUr1GZjZ44y
         /l1yuBA2c4qZGyJiShVC5ks6xbN27R7QbRjRmQPxbTHfPxebNVIv2Gnze8Ztj5lUVeYf
         C2bgT555v3T1quCJHxBEHT/xFAmidxL+Q2kVuAYROIgBqOUjiPl+Q1uuABS79fko4lbh
         v0TdZVwqyG6BDccrYJ6Ai4Ew2qWheZL0Hcq9qyRnhYekcf7JCwzOH1NFOpGcktf8KUy/
         +NPJNUNmkm09k9IrdcFyP62vJAMm0Jv/7nW3harfL7hdL+FRgFhGE7fihoOemKyHpKBt
         KdTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ElXUF1Sz1yF9+SZU/0T7IXAGmID2OBRK3ZbzsCy2qVs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XVVa9K5e4HJIobgx4uKey85jl68BcWb6HKUpymyC6z4ycBW4PdjXS8n86IBvwRoKMP
         ZO2ihuf1Pyz55gxa16fsZ5dGuqjO4h3mBcE2l4js6cjO4vMpjzwsp7fW3OVTrbzn6Cqi
         6Fu2Slm/vyMI3KhFGXBwPPOYFsGnh6s1MKd4MNSqXxBe7D8A5SuSmHjI6/ECC6tTRu+H
         GiLrlK5UABIVOiB/39rDCnPwsFS+nw91wYSLlr1CM4Jjv49a/0FGpKmedp0YZLDg3OKx
         KQ7h/lMLhp4BkfwsGAxacidihYv/ahhSeR/piFMnuxdNzXJgD6QDjNLwmk3EB9vTVt/d
         DO+g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984265; x=1702589065;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElXUF1Sz1yF9+SZU/0T7IXAGmID2OBRK3ZbzsCy2qVs=;
        b=a9gA+UT+UpTJo/MrbP47vyYdbs3GWL8t0R/aGu9VPDGs9dBw1PNpbR9C9DO+WXEURQ
         sSP2cTV9fGEGEwf46AqTC+RMxLWCntcSM3CuhuH7UfsCaeT6gU3rsd5YvSIvAyq+JIcz
         zZivVkfOlrrIonrMQ8O+zNFssSEM62P1ua21B6Ns51kcPAtbg26G1YYKnmUHN72LBSxd
         cbdne3r1ZFS/W9zSEy5gdEm2emix++njHqoE4z2YmIsUZG+veYKDL3Lx6GiAHTyBIknS
         kJjqAWEmCFFPBfVBu4WlesBqKCjS/IG8kKyXvzm8yQR2yNLzlAvJyrun3WyN77Ia9mJW
         0/Xw==
X-Gm-Message-State: AOJu0YzLxeOY5YLimUnofP7IuZ4h36YjkfAceYhtblsp20FPsZCDxkiz
	rD9ykC4PSLdWp86RJd5jkGgbAQ==
X-Google-Smtp-Source: AGHT+IHkOOignbC9mjg0Np0YzXWbfifsDTVX5oyfDZ6j6oljLpLUauzOBDkQgnYupo6yDUp2rC1QZg==
X-Received: by 2002:ac8:5ac2:0:b0:425:4043:50b9 with SMTP id d2-20020ac85ac2000000b00425404350b9mr3662529qtd.72.1701984264925;
        Thu, 07 Dec 2023 13:24:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:190b:b0:423:8c6b:5043 with SMTP id
 w11-20020a05622a190b00b004238c6b5043ls1584397qtc.1.-pod-prod-05-us; Thu, 07
 Dec 2023 13:24:24 -0800 (PST)
X-Received: by 2002:a37:f509:0:b0:77f:3bb8:baa5 with SMTP id l9-20020a37f509000000b0077f3bb8baa5mr1677466qkk.87.1701984264434;
        Thu, 07 Dec 2023 13:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984264; cv=none;
        d=google.com; s=arc-20160816;
        b=YJyJEpq2cyuheVOQ1lvE8CoQu2PEePkbMuV98MRU2x0ttx4nNYYgwSRBjUUxLOGs4H
         CwfvVVPS+QLvPAGIBfKPwWVSVpYOllTOOuUKLy55fY8+9nVujJM6+thISuu4bNy9f9XZ
         PalRkcS15RHqa/GOuPgjSrpSzj7fdqW6L+b1+PGUw60mdamocirnYEz+K/bJZ5QLAxfK
         X3YN/rnSDcMivNcvSu6s2AzLji0vE9Rmav13+mCkoF15oEnwpE9PfuYm9deSKRY7ePck
         jCym9KFneho8krMGXolxY05jFyD83siJ2qiKzyxzPQ85b5mhKXrmlC0pUBe8Vfq31zhD
         eIAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=0/ZWBPm/tHnmUrEq/8pNkYJ1kzJiXAey759Ylmcjid8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=NsaifDJmroLv8vnRbupo4PtRlWF6sWezSTPtDTkgdmU89VurEqzOwzOewAWqHXxa9d
         /CH79pi6ObcX5jZCZo+arhMJNHOSrZ0BLAli9Di8mx3iX/R72+lJKeNqsFPqTvB1X2oL
         l7vhnV8HHo+Him06FEQA4MTzzGo7U40FVRrRlMQrqAdsr+9tJogoB3F+67ckgYl+qSas
         cYitfDrHHEYgNrQJF+x93HgG5yEAHLFpHXMbGIMw9w9SdXk4X2mOPsdF0JHd8HBg4Vm/
         5R8rlVfhMaX9VWYbWDpH5YANa9vJMPKVvVrV1W/EhN0cIEVEw5qhKj/6OrLrXsUQR+K2
         JfIg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id x18-20020ae9f812000000b0077dd0fe28d0si495400qkh.737.2023.12.07.13.24.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-ZDRQbIdmPfaiEccB9VMWtw-1; Thu, 07 Dec 2023 16:24:22 -0500
X-MC-Unique: ZDRQbIdmPfaiEccB9VMWtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 641CC185A78F
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 619958CD2; Thu,  7 Dec 2023 21:24:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B769D8174;
	Thu,  7 Dec 2023 21:24:19 +0000 (UTC)
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
Subject: [PATCH v3 38/59] netfs: Decrypt encrypted content
Date: Thu,  7 Dec 2023 21:21:45 +0000
Message-ID: <20231207212206.1379128-39-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
index 9412ec886df1..b6c142ef996a 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -30,6 +30,7 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
  * crypto.c
  */
 bool netfs_encrypt(struct netfs_io_request *wreq);
+void netfs_decrypt(struct netfs_io_request *rreq);
 
 /*
  * direct_write.c
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 5d9098db815a..e4633ebc269f 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -400,6 +400,9 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 		return;
 	}
 
+	if (!test_bit(NETFS_RREQ_FAILED, &rreq->flags) &&
+	    test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags))
+		netfs_decrypt(rreq);
 	if (rreq->origin != NETFS_DIO_READ)
 		netfs_rreq_unlock_folios(rreq);
 	else
@@ -429,7 +432,8 @@ static void netfs_rreq_work(struct work_struct *work)
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
index c2985f73d870..50adcf6942b8 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -325,6 +325,9 @@ struct netfs_request_ops {
 	int (*encrypt_block)(struct netfs_io_request *wreq, loff_t pos, size_t len,
 			     struct scatterlist *source_sg, unsigned int n_source,
 			     struct scatterlist *dest_sg, unsigned int n_dest);
+	int (*decrypt_block)(struct netfs_io_request *rreq, loff_t pos, size_t len,
+			     struct scatterlist *source_sg, unsigned int n_source,
+			     struct scatterlist *dest_sg, unsigned int n_dest);
 };
 
 /*
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 3f50819613e2..6394fdf7a9cd 100644
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

