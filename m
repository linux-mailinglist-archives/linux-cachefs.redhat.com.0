Return-Path: <linux-cachefs+bncBDLIXLMFVAERBE52S2YAMGQE6IKDBKA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E7F89059A
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:38:44 +0100 (CET)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-60a0a5bf550sf21736687b3.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:38:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643924; cv=pass;
        d=google.com; s=arc-20160816;
        b=SCeyE489GSJXpYAaPwOaMRz0swAfirvwR5myWksX3m7iQHoZKc2io4AeMKrMRpWkBz
         YTTgZWCWgkESHvT3tHL9Q3RKDyE5pUCeIrNUiGBorqcBzbTTbIkQgWD42h4Y0LawYyJB
         nwq8TIzf+PnVzhx8i0nWO60fBqH7kCQXrFWatdAUQZ+kR1jyOmQidWnRYV/ECeP4F2SR
         lXKY4nbwdKOkocgLQ1TTVKDAyZkru1GwFoaop9mjCyzC2T5qTBCeMqj+eN5XtrVLQxgs
         /PXwi1zX8WyjK7xinWKNBuVcER+If5KmaKTxhfIz3E7nAfukZ0TNXFX9bAn5rKihaNqP
         ybOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=vazk4BkZT03o7lUoAsnElJ5FQs2iT6iM/72GfHMagp0=;
        fh=xdzVXseVfqDHc1Sy2JKgzKlyjnE9Pzc7YfPi6u5TRxs=;
        b=f0R3PMB/a+Vt2QBXVBj52d22BwEwxUm4EP2IH4mDe094F3bQRe1q9S/BUrWdvtI5wG
         4k4xouS+66VH1WUUXsMyHwvuXW9H2mTjnmHiX5qrE7RJA0tTr49KV0wWgM+DwUJ3kzLy
         IB/P0RPkNZF7LADkjHtUmsi5pfL4geXW5D0zthf5dP25qI49t0YGrRI4FkiCzHRcZ2Rt
         z63VufI6rwxLB0hn8xMpBaye7givRTsjCIyKHP4uJgO8JbzNbPIrxlL0Ia2nt/QeC8Z2
         5nonQNEYKAxh0oVmxrikeSasBcKd+59Vv3glyIa4uRawJQFp9lZgU7EKBS8BczGs/i6f
         9Ajw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643924; x=1712248724;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vazk4BkZT03o7lUoAsnElJ5FQs2iT6iM/72GfHMagp0=;
        b=lUlNrCS+2SsOuT9QMIJoHm/CIc9Fy/1eVF/WRpJ5my8TmPIx0ADmTa3/50J1GkRTfJ
         H7Vj/jJHvykKnyEmRHKV6V1aFLnMFkG7ydppjMu6Pz/3Ilqk4A2MiKqEvVVPb7mQTD12
         gcTxL5HSXF0evzPuiwfeqtFWyc2wnQPsqrXmcJPgo6z7zgP6DAjBHzm7C1QAX4InJmw2
         LNq5LsW4LFColgTXsCWLK5OnaZ5vmMX1/r4W+Yg1HXs49KrsQuKJCwihy1f83Fn7dX4L
         YHpupMG4tYRhl6VMxVMzTCFuaARx8PTbwm67FNjAbUwANk623uN+cupP4alYLKeHwP51
         Dgfw==
X-Forwarded-Encrypted: i=2; AJvYcCXYeO9KGLH0sLdMfnQwA12SkovYIrsN9VHJHcpm1Gb4x1NB3hIj5NeCblW4J1fzJqhOfH0ma32RV5uifJbbOxvKKDFcTMtPOnpSejw=
X-Gm-Message-State: AOJu0YwnGTfjmkgApc/Jz4yS7jKcr7wJIXLMzZWP9a4nA0fX4hvSEhNy
	DR3ajMzplaATku4qFkAwDa6/f6PBXrX7EwKRlpKMDTRlGuZy9SXhhg2wiFmqLZ4=
X-Google-Smtp-Source: AGHT+IE8+QFkIEUVwuEtkcInCxOEWSvO9RSKUS1eVo7zx1Qn4Ulg4iRhEkZxITvu8FmSn5gNpk3Zeg==
X-Received: by 2002:a81:c806:0:b0:614:ca6:1c57 with SMTP id n6-20020a81c806000000b006140ca61c57mr2851770ywi.27.1711643923785;
        Thu, 28 Mar 2024 09:38:43 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2402:b0:690:af1c:7f0f with SMTP id
 fv2-20020a056214240200b00690af1c7f0fls1348006qvb.1.-pod-prod-08-us; Thu, 28
 Mar 2024 09:38:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaxk+iFoHrij+qTTWglwmulgDAwOl0JBwNRIY5POLVblXgldXPnPSYE15ND0zMcIif/4BNq5WjJ+L5STCQWaH+dO7HF4Nq2j3j0klX230=
X-Received: by 2002:a67:e910:0:b0:478:224b:5aae with SMTP id c16-20020a67e910000000b00478224b5aaemr3417300vso.11.1711643923139;
        Thu, 28 Mar 2024 09:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643923; cv=none;
        d=google.com; s=arc-20160816;
        b=CVdEC91Xz6sHA3uNVQoZtUkeJJcQyr79dirfutjLjTIzx/1iIJ0cDGwNaMMvQZGURV
         gpYuG2dv6SmIm2S2WAmmtCVTtYvZAubQu/AsahuQOeRF5l1TRk3hWSVVP+BmHoaiQfBy
         FjnEvXrKvGrgQ3oELCFlEbAgRsF7cucxp8PoEVSHw/ME2YH49SAVf+dl0sgPl4Ggtfg/
         3uZ3z7XUtZvY485IbkgXRHqCD9vsfdeX12jwbOb0mriMnJwegT6lUOUbrxQYOG3zpa0R
         jM/OKHoRGn8YHIdD12j8E4YIfOaJga5IBEGvR6ZyLT9emgHlytwEhUSbILfXp84a5pe1
         RGww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3fwXy5U2z+oy82+iSz42Pbn48a/yMNGGfWVYA/FiX5g=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=uBXdsoh3bwq6EhJ9h3xbMU1LTFOJH43TjJCLYPU7+P5nN4jky4CeWieoEp5aaZn4zc
         9i1XvDd5sRC3vn343EUt0eOzQdWSKND0EIV1XGk+j/AcRrQ0NBBfhYTI4t9d2M5cskC8
         KEZQfT91iGYniKjrz+fZjj+H5WCZdWiB77IkRgnTK3lXlNyPDhdS5cqfbFrNxwfNFHlg
         Lh0IykQh6VKIcpCvHr+e7r8YSzX1asKRSLuiZC/P+qlpAkRWqIWxqfN82F0uJn96OI0D
         Uoi85A2b2WFnrBZT12z5uQoAX9wavqGVHaqHel2c9w4kmCd1D/bv/NjeCWQM5PQ+Bkvl
         pSKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id b13-20020a0561023a0d00b00476e7172309si342492vsu.122.2024.03.28.09.38.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-S4Eu-6XdNJu6FX4FYWkX2w-1; Thu, 28 Mar 2024 12:38:40 -0400
X-MC-Unique: S4Eu-6XdNJu6FX4FYWkX2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 341BE18172C6
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:38:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2C6BF2166B35; Thu, 28 Mar 2024 16:38:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 900352166AF5;
	Thu, 28 Mar 2024 16:38:36 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/26] netfs, cachefiles: Implement helpers for new write code
Date: Thu, 28 Mar 2024 16:34:14 +0000
Message-ID: <20240328163424.2781320-23-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Implement the helpers for the new write code in cachefiles.  There's now an
optional ->prepare_write() that allows the filesystem to set the parameters
for the next write, such as maximum size and maximum segment count, and an
->issue_write() that is called to initiate an (asynchronous) write
operation.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/cachefiles/io.c | 73 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 5ba5c7814fe4..437b24b0fd1c 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -622,6 +622,77 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 	return ret;
 }
 
+static void cachefiles_prepare_write_subreq(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
+
+	_enter("W=%x[%x] %llx", wreq->debug_id, subreq->debug_index, subreq->start);
+
+	subreq->max_len = ULONG_MAX;
+	subreq->max_nr_segs = BIO_MAX_VECS;
+
+	if (!cachefiles_cres_file(cres)) {
+		if (!fscache_wait_for_operation(cres, FSCACHE_WANT_WRITE))
+			return netfs_prepare_write_failed(subreq);
+		if (!cachefiles_cres_file(cres))
+			return netfs_prepare_write_failed(subreq);
+	}
+}
+
+static void cachefiles_issue_write(struct netfs_io_subrequest *subreq)
+{
+	struct netfs_io_request *wreq = subreq->rreq;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
+	struct cachefiles_object *object = cachefiles_cres_object(cres);
+	struct cachefiles_cache *cache = object->volume->cache;
+	const struct cred *saved_cred;
+	size_t off, pre, post, len = subreq->len;
+	loff_t start = subreq->start;
+	int ret;
+
+	_enter("W=%x[%x] %llx-%llx",
+	       wreq->debug_id, subreq->debug_index, start, start + len - 1);
+
+	/* We need to start on the cache granularity boundary */
+	off = start & (CACHEFILES_DIO_BLOCK_SIZE - 1);
+	if (off) {
+		pre = CACHEFILES_DIO_BLOCK_SIZE - off;
+		if (pre >= len) {
+			netfs_write_subrequest_terminated(subreq, len, false);
+			return;
+		}
+		subreq->transferred += pre;
+		start += pre;
+		len -= pre;
+		iov_iter_advance(&subreq->io_iter, pre);
+	}
+
+	/* We also need to end on the cache granularity boundary */
+	post = len & (CACHEFILES_DIO_BLOCK_SIZE - 1);
+	if (post) {
+		len -= post;
+		if (len == 0) {
+			netfs_write_subrequest_terminated(subreq, post, false);
+			return;
+		}
+		iov_iter_truncate(&subreq->io_iter, len);
+	}
+
+	cachefiles_begin_secure(cache, &saved_cred);
+	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
+					 &start, &len, len, true);
+	cachefiles_end_secure(cache, saved_cred);
+	if (ret < 0) {
+		netfs_write_subrequest_terminated(subreq, ret, false);
+		return;
+	}
+
+	cachefiles_write(&subreq->rreq->cache_resources,
+			 subreq->start, &subreq->io_iter,
+			 netfs_write_subrequest_terminated, subreq);
+}
+
 /*
  * Clean up an operation.
  */
@@ -638,8 +709,10 @@ static const struct netfs_cache_ops cachefiles_netfs_cache_ops = {
 	.end_operation		= cachefiles_end_operation,
 	.read			= cachefiles_read,
 	.write			= cachefiles_write,
+	.issue_write		= cachefiles_issue_write,
 	.prepare_read		= cachefiles_prepare_read,
 	.prepare_write		= cachefiles_prepare_write,
+	.prepare_write_subreq	= cachefiles_prepare_write_subreq,
 	.prepare_ondemand_read	= cachefiles_prepare_ondemand_read,
 	.query_occupancy	= cachefiles_query_occupancy,
 };

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

