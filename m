Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7XPZCVQMGQEIYQZA4A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6DB809386
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:15 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-589ce3eb26csf1375998eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984254; cv=pass;
        d=google.com; s=arc-20160816;
        b=QgtVdBrhP8qL4LIP5P0xNfFUg+zetYURszqkHgm04fLsiNXd59Bd82ZaElcKn9P5UU
         qYHGmHdokmbtM0pydXB4ub0oQ/mDffoPHV8q5E2jw0uu/8jBuDr/iZbkFrE2sWeknlY+
         m4OAvKESAsWVoqoVm3mebAZI0LjtW6OYxlvLNI9ocG+eF54v4mtsw7WqxGgPBuj1H6u2
         C5Ce7IODECJxnS+ra9Gmko+668snInarJ1Pe9KHOKoFb9hRCnHo97gxwcHlhToINVb0O
         VnhEB081oaBQ/Puio6AlbjJKv7PbP3HvNuIJ2v9qhFCYBTiZ+DbF1zDEb2eU1X/DCX6K
         C8KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=6Mq+ItchGu8ubloVcSp27zCpQW5TNzAGv8jyEA7CN9E=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=hzaojyE8Ko49TvkXUPkk7/a5OcFC60llrzKaKf5C/E/s4XJzeiEQCVQNTt05HFEYh7
         N6LhIVrrE3RmjCggz8Ac1J5z5RkyV048AfcSoTiToDT8lGSejLbidcaAeu4xeFxY7Ii6
         LYBSH+5AHeCm5aHH/NBAvt0b97UGlV1LnW18T5sCIoU8kUtCFIr6XFqGhGdwwqSjdtd1
         e6fkP4WeV6i8DAoGS1+ifEmcL+8AVLCRPOlVLf+KijJHpuG6U+iZCIx8Qv/DwYUEuzy3
         n8tBvFEQHR8vkurMXxxGr5fLYCYnT7edgKIZShYZTCgw5+kuzOTdC8wN/E9cw616uGl4
         6ygg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984254; x=1702589054;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mq+ItchGu8ubloVcSp27zCpQW5TNzAGv8jyEA7CN9E=;
        b=UssPOrhVyZu8H/ZK7RS8JwTKrVatI775vkLN/lMGYh0PqJ0gIL7a/QbZrmqRrhrBOI
         Df+XS4t7KgJtFjTYLFAC9fESpSv1fbTIQju2iSJQUkyZtIRVb4+AXQLtZ91cOWcdfL5V
         tbAaoZM2ffmcyKWky8ScY06d5gQ8swKuTinRanXYMtJSCAelNMab7REWkkkk0DAUQg9Y
         dAv6HswJ4ZjAHuX0XnNwD+998YNfsk48USK/doNhB3NAaoGf+amUS/VHnp1/yXr+4OPV
         2AXo1HoUaSCX2VeXYXcjLeVo+nSQ2cIDn+gHqzGJfXN4I6wD/UoTD/d1sNkcUdhvUwhB
         sPBg==
X-Gm-Message-State: AOJu0YzDfBGyNz6jQKlOEaAaVw7mxbhvAViQJfDLA/c+cORJ8xRM8vM0
	iuxQAfwl1TW+0DKApqFW0QKOTA==
X-Google-Smtp-Source: AGHT+IE6I4/td8V08+1pAf8eqP/H5QpKSPHVLcsV0FFSaNtsGTnN4D1s4mBjPcaN5EtJvFdGmCLWFA==
X-Received: by 2002:a4a:854f:0:b0:58e:1c47:8db3 with SMTP id l15-20020a4a854f000000b0058e1c478db3mr2638827ooh.13.1701984254526;
        Thu, 07 Dec 2023 13:24:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:605:b0:58d:6d88:2214 with SMTP id
 e5-20020a056820060500b0058d6d882214ls1080731oow.2.-pod-prod-05-us; Thu, 07
 Dec 2023 13:24:14 -0800 (PST)
X-Received: by 2002:a05:6808:4c3:b0:3b9:dd3b:464c with SMTP id a3-20020a05680804c300b003b9dd3b464cmr1880484oie.103.1701984254022;
        Thu, 07 Dec 2023 13:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984253; cv=none;
        d=google.com; s=arc-20160816;
        b=djOhU02K/ctCgxnFzQNUANVkBvz0DPRq/MWTzziSGzvx2SYKnLRWatk4UMm3wADgxC
         7rCpIuD/74OibuANUqyWllGRusI1um0hvdlAzOxRnavKjYOGBK7moRoJUvj1D/+eR681
         u+sEVeOnShLkJPHrwqmMd8ZeqhKxmxWuSL2BRrVO/rNJM641CcZHqOltlPQ2uesx1RGs
         NbQNij5jYcKHJF43Ji2sxAY8wL6QDrnDsz8e0dwwi9UWeEIzmZy1kvifq7ctOJwf6FI5
         +ijoM8QDguyYcNTrWHpxY+/a7Pxt9ezb5LEY6uamdGyhai94fqjm9pcs/A4gohzCtqoy
         /Iwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gDEVNBWkDC1KjDnrtBrbZBZNboYk+5MLxRm91IWt834=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=EmsQcRugXTrltnMmlcnll7GE+8EJl3VC790+XCLQLlq1u/3ACQNYiTwEShgMjOqfCS
         Sfu7ZpDxFP4Yf43xsMpZoOWyhPjOGTOER0BFJwXBtv6K5WbUjixbU0tYAyBQIJfyqvwJ
         pNP6B9uJQOnCGwFLpXki1/EO2WvU5weBNpSksRhKJ/eDio/sHKKtzQTx8gj8ZbUDa8W9
         nOH8TtQpCz4WDNw2S5oTe2oa+hNQz9nqfyIqMobIWPeLIfENhKZae/lFizRgD7I6nlxY
         cqYpqcF7VYzYm6T2ae2f9hSJW16citP6HNPjlQ4emX7hPbhMRfF6Us6PVZOA5I6JphRa
         30DA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id t20-20020a05620a451400b007783026be9esi633039qkp.621.2023.12.07.13.24.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-jZOVRp2qMDGLSyYozxH1YQ-1; Thu,
 07 Dec 2023 16:24:12 -0500
X-MC-Unique: jZOVRp2qMDGLSyYozxH1YQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 498783C40B56
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4612E1C060BC; Thu,  7 Dec 2023 21:24:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C42B1C060AF;
	Thu,  7 Dec 2023 21:24:09 +0000 (UTC)
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
Subject: [PATCH v3 35/59] netfs: Provide minimum blocksize parameter
Date: Thu,  7 Dec 2023 21:21:42 +0000
Message-ID: <20231207212206.1379128-36-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Add a parameter for minimum blocksize in the netfs_i_context struct.  This
can be used, for instance, to force I/O alignment for content encryption.
It also requires the use of an RMW cycle if a write we want to do doesn't
meet the block alignment requirements.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c  | 26 ++++++++++++++++++++++----
 fs/netfs/buffered_write.c |  3 ++-
 fs/netfs/direct_read.c    |  3 ++-
 include/linux/netfs.h     |  2 ++
 4 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index a59e7b2edaac..0d47e5ea6870 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -521,14 +521,26 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 	struct address_space *mapping = folio_file_mapping(folio);
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	unsigned long long start = folio_pos(folio);
-	size_t flen = folio_size(folio);
+	unsigned long long i_size, rstart, end;
+	size_t rlen;
 	int ret;
 
-	_enter("%zx @%llx", flen, start);
+	DEFINE_READAHEAD(ractl, file, NULL, mapping, folio_index(folio));
+
+	_enter("%zx @%llx", len, start);
 
 	ret = -ENOMEM;
 
-	rreq = netfs_alloc_request(mapping, file, start, flen,
+	i_size = i_size_read(mapping->host);
+	end = round_up(start + len, 1U << ctx->min_bshift);
+	if (end > i_size) {
+		unsigned long long limit = round_up(start + len, PAGE_SIZE);
+		end = max(limit, round_up(i_size, PAGE_SIZE));
+	}
+	rstart = round_down(start, 1U << ctx->min_bshift);
+	rlen   = end - rstart;
+
+	rreq = netfs_alloc_request(mapping, file, rstart, rlen,
 				   NETFS_READ_FOR_WRITE);
 	if (IS_ERR(rreq)) {
 		ret = PTR_ERR(rreq);
@@ -542,7 +554,13 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 		goto error_put;
 
 	netfs_stat(&netfs_n_rh_write_begin);
-	trace_netfs_read(rreq, start, flen, netfs_read_trace_prefetch_for_write);
+	trace_netfs_read(rreq, rstart, rlen, netfs_read_trace_prefetch_for_write);
+
+	/* Expand the request to meet caching requirements and download
+	 * preferences.
+	 */
+	ractl._nr_pages = folio_nr_pages(folio);
+	netfs_rreq_expand(rreq, &ractl);
 
 	/* Set up the output buffer */
 	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 42f89f8ea8af..8339e3f753af 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -80,7 +80,8 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 	if (file->f_mode & FMODE_READ)
 		return NETFS_JUST_PREFETCH;
 
-	if (netfs_is_cache_enabled(ctx))
+	if (netfs_is_cache_enabled(ctx) ||
+	    ctx->min_bshift > 0)
 		return NETFS_JUST_PREFETCH;
 
 	if (!finfo)
diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 1d26468aafd9..52ad8fa66dd5 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -185,7 +185,8 @@ static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_
 	 * will then need to pad the request out to the minimum block size.
 	 */
 	if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
-		start = rreq->start;
+		min_bsize = 1ULL << ctx->min_bshift;
+		start = round_down(rreq->start, min_bsize);
 		end = min_t(unsigned long long,
 			    round_up(rreq->start + rreq->len, min_bsize),
 			    ctx->remote_i_size);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ef17d94a2fbd..69ff5d652931 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -139,6 +139,7 @@ struct netfs_inode {
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
+	unsigned char		min_bshift;	/* log2 min block size for bounding box or 0 */
 };
 
 /*
@@ -462,6 +463,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 	ctx->ops = ops;
 	ctx->remote_i_size = i_size_read(&ctx->inode);
 	ctx->flags = 0;
+	ctx->min_bshift = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

