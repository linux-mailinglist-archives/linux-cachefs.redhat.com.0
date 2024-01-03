Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3HM2WWAMGQEI76I5WY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EFD822FFA
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 15:59:58 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6dbfdb1ce00sf8084736a34.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 06:59:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704293996; cv=pass;
        d=google.com; s=arc-20160816;
        b=G3zdg5ePZ2ylB4FxwljjUg2KD5TNlDIocR9qRwSLJLwPTwe2YxQuI0LfwABjM0uvYK
         UKYuTKb97GgtAgWWaQRdx/6JO/11NJzLxcL/r92TO+HnoKUOOSR8L+tMFuQk4CF62PhC
         vaYYYGUIKqUYDiMBBJjZkxK/lPZ7rtcp90AAmnz4M0EVslVLdgntzbOB4cLm/hhZ8sS0
         7PTeZkGHbGkhWwFEO5rWRG5xbyE2Spyze7NT24E40FGA6AU8nmAQQrD+2izDxelmRpHa
         sMDsXJ3oHLc9Gak1/tTETP8PbkHjYW3m4nUNBNJxpSiTpcFbTfmnVVHkUM92XZPnOl7d
         Fn4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5TUxr72+eHi7isWBE0N98hAVz9y6U3e0X2MQ5ztqGNo=;
        fh=6hlFWZUR5wi9f3e2PaIraYIVPbYx15pYt1xJq7VLTTU=;
        b=yHHr+hpHBsIpzvzlKAvD8UEwK1MGMz+DGHFkqwZGcu1pPDuKANfkKXj9kaeaK3PsHy
         zbWL6Hc9zmlMGjpikSa4H1HKdyPeVT/0o1p50x3UXtJRQ3iVZb6E8d5PZfyarJ9XJDbq
         F/3DijefaFCA6CQ6/xK86Vf+nAW94ytO1ZybS6ztlilfZaEDfAg+qPbINx//k4WqOeqp
         1Bz6wYFi3qLc/SDIzc+1FwYhQLq7D7wxg9xPQJSyFLgsb2i9fsm3p2RjQqpzIa3eoPjQ
         k3FWvW6NMlr2BYbrM6bUyPxkBuMsTEZL4qvBVmv3LpA2JiMoUhsbZDU80YefIaHrnlJr
         9x4A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293996; x=1704898796;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TUxr72+eHi7isWBE0N98hAVz9y6U3e0X2MQ5ztqGNo=;
        b=nP6gLzCmhY9Vth07pW2/e9Yns6hu3f8K3Xek9DeJ2+aUqui/ToBQY+zJf+Ar1tiBNF
         SyFUKLRHxn/ecpNTUbpcNsl4slVZ/QRuQdhD9iSw5Fp0HShOc9TzhxcGeH5223GAsEjU
         1XP+uE4/9j+w5jvRqqId0oCUAFtldZEzqP0QnIf/sckqTwCbHJQdRRC9oQ/rWGgzg/kM
         1vhkW5hWiExp0YzqDN75e4ClR4RG+SRbIllRXt/UHq6eX4OafSJmmTsX6ebnIPwtAB8N
         ipZcMyhIYSC4N1//pytwxgYOUZ0tCCGPXJkiAWycNkBttFglffd6d6r/umqFGlNs1+Ri
         9Y0A==
X-Gm-Message-State: AOJu0YyD+mqxWyju4dHp1FjdwoZrbHV8mBLT44V7PmvMzizWAr62XJBI
	FX3iXHh/3qG50PfOzF5NX4e8LIwNxs5z0w==
X-Google-Smtp-Source: AGHT+IGp9Afe3duMaBeXB8v2Cd0Biy6MrtmCIe8I1y3mAME5/2wRwKrh4m0z9j2nyFOpJpdWqpdXjg==
X-Received: by 2002:a9d:6353:0:b0:6dc:656:8520 with SMTP id y19-20020a9d6353000000b006dc06568520mr7476670otk.77.1704293996731;
        Wed, 03 Jan 2024 06:59:56 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa0:b0:428:34e3:e198 with SMTP id
 s32-20020a05622a1aa000b0042834e3e198ls1362699qtc.1.-pod-prod-08-us; Wed, 03
 Jan 2024 06:59:56 -0800 (PST)
X-Received: by 2002:a05:620a:21d5:b0:781:be05:8947 with SMTP id h21-20020a05620a21d500b00781be058947mr3897067qka.125.1704293995976;
        Wed, 03 Jan 2024 06:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704293995; cv=none;
        d=google.com; s=arc-20160816;
        b=OuVZ+XL6J9FB5pUgmIhVa1Rgaqv4xKczcIiZ53y9pxGkVvKq/E6PVaj3Y0Dt5DJy0L
         mrES9+sAvAbpyMhjYbn6wKsMrnXggraIMOBF/dLAUAWW4lDQgTWWjp6qXqUO4SZ55FRM
         ggaP9h73gfPsapJxmCiSJKBce0pBrj3gkg2j4acPxHGtZH+mUfFhx012YroQmCqKyX3K
         spKjt/BmpzFRNJQ/PZOUPy5Rr69PmvaxvudU5MngHtTf0QtzrTD/MnfiPAZv/dai47CX
         taB+f39dwZYDbCly6B04Qgwpk4cPsnp2UglX88Q3irPEKs+UZKbwMoQDYmhuYmM6CuaC
         7RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SdFCD8YJUNnwtU5qwz/M+xF7ih7tS/QW8qR9RpiR7QY=;
        fh=6hlFWZUR5wi9f3e2PaIraYIVPbYx15pYt1xJq7VLTTU=;
        b=xa62USkRBdfszpGkgGcTOIq6OySoZHtmzEZC+LpjtHZD5HxmzuWc9Pomrs5Vfktltm
         JierM60btpdr7NuUO1wUZ7m5Z4np+EkGB99l14NpbLIzUoRfLhLb0CsvKPGpXuchwMVW
         nByfM9kj1UiEfFgkJSbeP3X0M6ZO3BcmDhope0iBvF0KgbCQRMYelGZkPqb/gkz8xDeD
         3PD8fT0kYawADnbyQ5MfYCYsw74qwyPYpWzcFG1qQfdNAGk1y3SPVUz9wj1epsjc13lg
         4zWp2VBbRVGIBz1oox1zJBLU8pDmaA4BNSuiorSx9x5euuRdsPRUVq4Ud/kpYIelOO6C
         S8Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g8-20020a05620a40c800b00780fbb0f4ebsi29943331qko.365.2024.01.03.06.59.55
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-GRxIF9i8MdO1KZafZU3Zmg-1; Wed, 03 Jan 2024 09:59:54 -0500
X-MC-Unique: GRxIF9i8MdO1KZafZU3Zmg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C95A881B6E
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 14:59:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 38C8B3C31; Wed,  3 Jan 2024 14:59:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 45F673C27;
	Wed,  3 Jan 2024 14:59:49 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
	linux-kernel@vger.kernel.org,
	Yiqun Leng <yqleng@linux.alibaba.com>,
	Jia Zhu <zhujia.zj@bytedance.com>
Subject: [PATCH 1/5] cachefiles: Fix __cachefiles_prepare_write()
Date: Wed,  3 Jan 2024 14:59:25 +0000
Message-ID: <20240103145935.384404-2-dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Fix __cachefiles_prepare_write() to correctly determine whether the
requested write will fit correctly with the DIO alignment.

Reported-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Yiqun Leng <yqleng@linux.alibaba.com>
Tested-by: Jia Zhu <zhujia.zj@bytedance.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/io.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index bffffedce4a9..7529b40bc95a 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -522,16 +522,22 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
-	loff_t start = *_start, pos;
-	size_t len = *_len, down;
+	unsigned long long start = *_start, pos;
+	size_t len = *_len;
 	int ret;
 
 	/* Round to DIO size */
-	down = start - round_down(start, PAGE_SIZE);
-	*_start = start - down;
-	*_len = round_up(down + len, PAGE_SIZE);
-	if (down < start || *_len > upper_len)
+	start = round_down(*_start, PAGE_SIZE);
+	if (start != *_start) {
+		kleave(" = -ENOBUFS [down]");
+		return -ENOBUFS;
+	}
+	if (*_len > upper_len) {
+		kleave(" = -ENOBUFS [up]");
 		return -ENOBUFS;
+	}
+
+	*_len = round_up(len, PAGE_SIZE);
 
 	/* We need to work out whether there's sufficient disk space to perform
 	 * the write - but we can skip that check if we have space already
@@ -542,7 +548,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_DATA);
+		pos = vfs_llseek(file, start, SEEK_DATA);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		if (pos == -ENXIO)
 			goto check_space; /* Unallocated tail */
@@ -550,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if ((u64)pos >= (u64)*_start + *_len)
+	if (pos >= start + *_len)
 		goto check_space; /* Unallocated region */
 
 	/* We have a block that's at least partially filled - if we're low on
@@ -563,13 +569,13 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	pos = cachefiles_inject_read_error();
 	if (pos == 0)
-		pos = vfs_llseek(file, *_start, SEEK_HOLE);
+		pos = vfs_llseek(file, start, SEEK_HOLE);
 	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
 		trace_cachefiles_io_error(object, file_inode(file), pos,
 					  cachefiles_trace_seek_error);
 		return pos;
 	}
-	if ((u64)pos >= (u64)*_start + *_len)
+	if (pos >= start + *_len)
 		return 0; /* Fully allocated */
 
 	/* Partially allocated, but insufficient space: cull. */
@@ -577,7 +583,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	ret = cachefiles_inject_remove_error();
 	if (ret == 0)
 		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
-				    *_start, *_len);
+				    start, *_len);
 	if (ret < 0) {
 		trace_cachefiles_io_error(object, file_inode(file), ret,
 					  cachefiles_trace_fallocate_error);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

