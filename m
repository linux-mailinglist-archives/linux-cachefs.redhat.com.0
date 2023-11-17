Return-Path: <linux-cachefs+bncBDLIXLMFVAERBA5R36VAMGQE5BKZ2KI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E47EF9B9
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:57 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-66fa17e145asf29531866d6.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255876; cv=pass;
        d=google.com; s=arc-20160816;
        b=oN8O020fxie2fy3qOh3BXdBEwiGAMPplhNOSg4gionslDtc8kr0B2h9EvVtDT0YeNE
         9QRS7kbf2+AXMr0sbj4+uFY8Gd3/7wJPhyucNlPskd6Fe3JUDq00a2HbIO9ma7jLY+ps
         xdXU24n+8v5Nfx9Roh5atifGXOI49NveMFf83O+wwq9tTngcIUHwwu3HcNXoBWLyvjTZ
         +n42j8/Un2cIQ/HvmYRDwIwChBvAlVYxaqR4ZwoqDASjn4JuG2bJkYGWWVUKrzhSVVax
         pkq41TQrilqv7zvJEmHIlolUhfJfXzL/25xtg+Sezxi+TBfoeruQuB7sWt0JUV0HapFW
         y8fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wem5nCa6TVAnsSjhnFBE0he/hNEmPlS2I1iRYwYIuHo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=hXe//3Futqsr2ik+syBYcKZCokqBJzBB3utxMDeCdn7Xqp1jgEZf+MyFVkSZjeP6hS
         jjQm1kgH9YU6KyQG4GiqVmDXJPLHCQf4hzQdJobh6qbWU7wyceeV4DheBTLakj0RfJfO
         vo8N6GZvvh6+Ghqycxt8NcHIHgySj2nAwLaj4HYCsM3ieZ+adHrYU/2a+xJbHIqJiwVJ
         4+/njHb7jH4b0YBoA1IxQVNG6WpPdxPHbnsPY3tV/cs3HUQljFwT1ttcDRLPRIBZzI8L
         8z4KNbNTAK9Igzg0E/7ZsSo/O8aSWMCsiHvcHYH8rP7GYvHG6pY3tld6f1GIUj3okb0z
         GyvA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255876; x=1700860676;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wem5nCa6TVAnsSjhnFBE0he/hNEmPlS2I1iRYwYIuHo=;
        b=fJqCe5Sqgn16xcc1HQo2o/AwJsdDm3T6XBKIBRm6ps5BbBeouh8u6TuToMX0vystpk
         jgBf1eq+64smvUADWceOXvzyXqropbNcSTQlJSagVlTybSihy9YUBsHbfe3mXZJoLnmH
         ozf0EaT/nZoQTMISG9O3E921yJ2WJyWy46YSfe1ZsKvqOf4ypBlGgjb36hs45GyqgdfP
         n3YKsEAUbznD+g8T35tb1XdJfYq+JZysl4NEiUwWkfErbkwAE+wiBNYfma3DIZGRknpN
         B0n7evHlyjJq1JabC5hmSPOOGItjSQW8FC2s9ETZp5sGEiF4UFTKxByJ4KSbs0DH5iVR
         eiqQ==
X-Gm-Message-State: AOJu0YxkfxiFBgjmOJ2EGhmxQuFYWtW6cazdTHPvEKHyBsmFOTAr1g8N
	v9nJJohPOCryczlrnDZ+7TMJdQ==
X-Google-Smtp-Source: AGHT+IFpQTdLXwYPKkehJMuC7Q9oHpoSOdqeACUo0DArkA4Ie1iKbVyu9Lq9HQC/+stE2dPAZAjMHw==
X-Received: by 2002:ad4:5cc9:0:b0:66d:2aa3:cd49 with SMTP id iu9-20020ad45cc9000000b0066d2aa3cd49mr375976qvb.14.1700255875927;
        Fri, 17 Nov 2023 13:17:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:709:b0:65d:592:a279 with SMTP id
 c9-20020a056214070900b0065d0592a279ls1772577qvz.0.-pod-prod-04-us; Fri, 17
 Nov 2023 13:17:55 -0800 (PST)
X-Received: by 2002:a05:620a:9447:b0:778:9130:dbd1 with SMTP id sm7-20020a05620a944700b007789130dbd1mr675293qkn.36.1700255875466;
        Fri, 17 Nov 2023 13:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255875; cv=none;
        d=google.com; s=arc-20160816;
        b=xa1Pm+tLq9sjOq3nOt0BFYnB9grNU3E/BTmwz0baAtUUE386DYK5jzPvYEAQ5suceS
         p3gg3+zRqZhEgUEDY3TWCVy4ZihJp7uCZHA37hywP5UCGnkYQ82I3UCwkUzp/I9Pibbu
         iPWd8/NhQOQt2MzbYnq2Zuzz6/Xf0r+7Vw/kuP7txnU6vG1/u3dsA5QiCat74coReWSa
         uRTyaZdl2pLMYSeroJNNIpjywQeZfZNkhk6Hhobb+EI49uNV1uKqCw0faL0jyM2i3h+L
         lbHhx5CoWatsWXN9dFI7DlcfCoD2lqdykc36Fz8IpgD6KgU221CL3jLfNMXfj0AokJbi
         McSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ablsJdTiyO2NAigj2ijcrkqA9EUIfyGm7/v4HJQaeAo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=KIKzJ9hvCdBtuB2+/RSX5Sc5//NZDc3OnvxTfI3pPdPjjzp6lRzwccJ5N+sI/ePQnX
         vmYWJHCfT9rKw3t+i7NZZZYBr9A3O5STvUfBcdACAo1prHNhoyXv2GlxcHlXra4NJN02
         DtyUSMUIFo5LxM/VegOuV9szwpXS1sxF/EJRE+Ifg+DUzfYOTR0dTu1tAf93W43ljckH
         NAP/hSmbMxWFHdyCfSNdaoCuRCWusLZKMDj+VZI8UV78JgQJUKMnkneLureMvG9Xs95+
         veuNdbatCXf2Wp4MgvkyCEkzSWVLJeummQLdnGGdysqOQg0FubfFjoPLKD54MN9EjiO/
         oWNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id az9-20020a05620a170900b00775c5458f6esi2678048qkb.267.2023.11.17.13.17.55
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:55 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-nlu6pvfDNWKoT9nWBTjK7Q-1; Fri,
 17 Nov 2023 16:17:53 -0500
X-MC-Unique: nlu6pvfDNWKoT9nWBTjK7Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D95B382135D
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5A77F492CAB; Fri, 17 Nov 2023 21:17:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B99B6492BFD;
	Fri, 17 Nov 2023 21:17:50 +0000 (UTC)
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
Subject: [PATCH v2 31/51] netfs: Provide minimum blocksize parameter
Date: Fri, 17 Nov 2023 21:15:23 +0000
Message-ID: <20231117211544.1740466-32-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
index ab9f8e123245..e06461ef0bfa 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -527,14 +527,26 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
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
@@ -548,7 +560,13 @@ int netfs_prefetch_for_write(struct file *file, struct folio *folio,
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
index 097086d75d1c..4f0feedb357a 100644
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
index 02a8ddddc8cd..cb80de66d165 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -141,6 +141,7 @@ struct netfs_inode {
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
+	unsigned char		min_bshift;	/* log2 min block size for bounding box or 0 */
 };
 
 /*
@@ -463,6 +464,7 @@ static inline void netfs_inode_init(struct netfs_inode *ctx,
 	ctx->remote_i_size = i_size_read(&ctx->inode);
 	ctx->zero_point = ctx->remote_i_size;
 	ctx->flags = 0;
+	ctx->min_bshift = 0;
 #if IS_ENABLED(CONFIG_FSCACHE)
 	ctx->cache = NULL;
 #endif

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

