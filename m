Return-Path: <linux-cachefs+bncBDLIXLMFVAERBH4246VQMGQE5A7NSVA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AC1811673
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:26:24 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58a8142a7a7sf8333121eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:26:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481183; cv=pass;
        d=google.com; s=arc-20160816;
        b=fRFf6ZZ+WWuTXn91Jms1clRj4ZJCf2GYEQaVH9SAMtL35Kk64HTGp1CPhR8RzK+Az/
         3QA6uDSSUKKsYntexXqLswjDWW4rpCwk8ZT5Mgc0/wvqkfODk1oIAEeWj8v+bQg9LmjR
         +zJ5O6Nq6Nr+K6H3mRp1d5KnbMYFT1vmRPggQ6Y+zDBByPJzUL0bbZojYDmbTTodGlsC
         eISM/F1LwrstZgQs2seX4SioZCaMjqbWXna2Q2GPAzGVLkJlHutn8zdJzlhxVF6tYDbP
         G7wGhmC4H4BFn4YNOAEdqothcr1A1AoS56Lwplio6pShIg2r+F6N/XmZKnBGOt4J9uuW
         IwYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=d6rWfN60iQDHeSsPn3vOAD+PTmB0MyW7wDXX9DBzjZI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Vp+Q6QgXvSdYlD5CjcbZwnXHGOWPJfF+M623jpeGuxevKmE90/QVvBIjK66SBZPbeM
         R+pLElh2gQPxBgk1fQxRyW0ur5Ng7U1LX033DJyJn6kpY+04MB5Xez1uxQDz1g7dwqbi
         23TJqpxKN67RzeaQ6NLL8Q8mVkICBiSqiBvVz/RdxiPpR+7GVSYX2nKyCk4848USnB/m
         Y+CXsQclN1aDiJ0umwBgz+SHg+n9AcZxX7kF287fvwk6vfZZWPbwBTcRyHVUkropCJIH
         6keOWgUSesC21eae8oUyJEafqNDphw2gPqzl1m82bNIwBsOSqiVyazfpilPDpsU0qFMY
         UUWw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481183; x=1703085983;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6rWfN60iQDHeSsPn3vOAD+PTmB0MyW7wDXX9DBzjZI=;
        b=W2vnxdpHkqoV9trjGuSvg0tBb2lIEQxFVwF8mmDIizkr6ttV6CkyeiaBySU/XwnEVT
         +qa2KQAOP0xbj7nAfocWW84E5SFUdjT4HqsOzBLSIUaPaeSbhVi1uTGBYhK1u1FSmRPO
         vyUuvtbKT5ZiTuFLAWv2kFGctEs6vYqE351arKPez9mWItXxcQx3XpfLxX0aJcgDm7Y9
         AY1cjE3T8boEtNvv1X1dTm5+j2pPsnmuBMjT8DWI3pX2+bOx/RJBtvG7cPvd8gdiXxQD
         JoGFQqVZzJ1xPPzGCXHaWKRLcXBtW9PB/XFzVi1zWpPgnd9CtMDD3JDGCImOtXwLP7jk
         akUQ==
X-Gm-Message-State: AOJu0YwwtQGTpvhzwcn6u1lLU+oZT6zEu5RXHl/6MlRNTN+8o8r4Y9JB
	hBQWK8tILvm6o/kX72GL44g/Yw==
X-Google-Smtp-Source: AGHT+IEKIk+TkA0KNBwL5BftZKUwsaUYSel4QhJT+m3RvgLBQ7jLO2CJzSxSPyQ8Im39fHOOlegnRw==
X-Received: by 2002:a4a:3847:0:b0:590:7391:1dee with SMTP id o7-20020a4a3847000000b0059073911deemr4318534oof.16.1702481183467;
        Wed, 13 Dec 2023 07:26:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:505:b0:58d:9776:771 with SMTP id
 m5-20020a056820050500b0058d97760771ls195805ooj.2.-pod-prod-02-us; Wed, 13 Dec
 2023 07:26:23 -0800 (PST)
X-Received: by 2002:a05:6830:1d8a:b0:6d9:d132:e047 with SMTP id y10-20020a0568301d8a00b006d9d132e047mr7365020oti.31.1702481182865;
        Wed, 13 Dec 2023 07:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481182; cv=none;
        d=google.com; s=arc-20160816;
        b=LoSghaoGCEuonJDXOOgeUrGrzwwf4kjGjNyROxDPaXByj/eigcGR1Jpwtb1P6BkoEH
         GH8bozdJwSnD9l60DMqpZ1cJGHlNOBOkjVfO4yRfNukShJSs70pblj/pEV3QoSv7faFl
         SoeJXKmYNImkB76VRvpAoLo1P46iVBuuO7kJG20r3cA8Qhqs9zy9eeimxwzWEMbGT8Bi
         rDp4tBPr3FBbZKWiVB82U0SCOFW7SBDqszvADenswhLT7K8w0PJHzdhgQwtP7AA+dQGB
         OOiUjjN5QCVvdzCWXaONdS/hqTEuEzAEwomO/pQzTwvZ1qtIGccJvwPqIzEq9/SzJDT/
         kqVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GWz3UetJ1H2inkDCEy0FPsiHj6M0nuo6NxktZOcXvKA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=kiU2wLwydF8Kcpnjn9nwf3aDdLJQEJRvIfoRso9IcBjt8oE4TEcCHKRXCW83LJuhvF
         lA1L2yh2Xe/zQW5/20GJRgbbpIjffyBCvHIqFAIIRoVoXYFwZIAy4al0n2LHW57hHmRk
         P7LWlXzPeotDP69s+5cQe0ZL/Ry0mOqSkhFIyad+PVYfQ42CBOnTSCYLnOcyORCs8qS9
         GMRXWPULYUes59yamSlO9FkQ6brWf7Oekf61DS7BY2h8ZCCsT3XSAtUIJRumfW86MKra
         tfEk3dmrm+sDmRjUZNf09CJlLvcn5QhWw3AGkbzlVHytfEdY06eR1pIdbeX7njlaz3iG
         3axQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w3-20020ab02803000000b007cb5d620c96si95304uap.173.2023.12.13.07.26.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-GHOOhEwaM8Wfa4tF72g29A-1; Wed, 13 Dec 2023 10:26:21 -0500
X-MC-Unique: GHOOhEwaM8Wfa4tF72g29A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E173F85A58F
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:26:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DDA242026D6F; Wed, 13 Dec 2023 15:26:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68A102026D66;
	Wed, 13 Dec 2023 15:26:17 +0000 (UTC)
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
Subject: [PATCH v4 33/39] netfs, cachefiles: Pass upper bound length to allow expansion
Date: Wed, 13 Dec 2023 15:23:43 +0000
Message-ID: <20231213152350.431591-34-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Make netfslib pass the maximum length to the ->prepare_write() op to tell
the cache how much it can expand the length of a write to.  This allows a
write to the server at the end of a file to be limited to a few bytes
whilst writing an entire block to the cache (something required by direct
I/O).

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/internal.h |  2 +-
 fs/cachefiles/io.c       | 10 ++++++----
 fs/cachefiles/ondemand.c |  2 +-
 fs/netfs/fscache_io.c    |  2 +-
 fs/netfs/io.c            |  2 +-
 fs/netfs/objects.c       |  1 +
 fs/netfs/output.c        | 25 ++++++++++---------------
 fs/smb/client/fscache.c  |  2 +-
 include/linux/netfs.h    |  5 +++--
 9 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index 4a87c9d714a9..d33169f0018b 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -246,7 +246,7 @@ extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
 				       enum fscache_want_state want_state);
 extern int __cachefiles_prepare_write(struct cachefiles_object *object,
 				      struct file *file,
-				      loff_t *_start, size_t *_len,
+				      loff_t *_start, size_t *_len, size_t upper_len,
 				      bool no_space_allocated_yet);
 extern int __cachefiles_write(struct cachefiles_object *object,
 			      struct file *file,
diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 5857241c5918..9fe69a60eb24 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -517,7 +517,7 @@ cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
  */
 int __cachefiles_prepare_write(struct cachefiles_object *object,
 			       struct file *file,
-			       loff_t *_start, size_t *_len,
+			       loff_t *_start, size_t *_len, size_t upper_len,
 			       bool no_space_allocated_yet)
 {
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -529,6 +529,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 	down = start - round_down(start, PAGE_SIZE);
 	*_start = start - down;
 	*_len = round_up(down + len, PAGE_SIZE);
+	if (down < start || *_len > upper_len)
+		return -ENOBUFS;
 
 	/* We need to work out whether there's sufficient disk space to perform
 	 * the write - but we can skip that check if we have space already
@@ -591,8 +593,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 }
 
 static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
-				    loff_t *_start, size_t *_len, loff_t i_size,
-				    bool no_space_allocated_yet)
+				    loff_t *_start, size_t *_len, size_t upper_len,
+				    loff_t i_size, bool no_space_allocated_yet)
 {
 	struct cachefiles_object *object = cachefiles_cres_object(cres);
 	struct cachefiles_cache *cache = object->volume->cache;
@@ -608,7 +610,7 @@ static int cachefiles_prepare_write(struct netfs_cache_resources *cres,
 
 	cachefiles_begin_secure(cache, &saved_cred);
 	ret = __cachefiles_prepare_write(object, cachefiles_cres_file(cres),
-					 _start, _len,
+					 _start, _len, upper_len,
 					 no_space_allocated_yet);
 	cachefiles_end_secure(cache, saved_cred);
 	return ret;
diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
index b8fbbb1961bb..5fd74ec60bef 100644
--- a/fs/cachefiles/ondemand.c
+++ b/fs/cachefiles/ondemand.c
@@ -50,7 +50,7 @@ static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
 		return -ENOBUFS;
 
 	cachefiles_begin_secure(cache, &saved_cred);
-	ret = __cachefiles_prepare_write(object, file, &pos, &len, true);
+	ret = __cachefiles_prepare_write(object, file, &pos, &len, len, true);
 	cachefiles_end_secure(cache, saved_cred);
 	if (ret < 0)
 		return ret;
diff --git a/fs/netfs/fscache_io.c b/fs/netfs/fscache_io.c
index 79171a687930..ad572f7ee897 100644
--- a/fs/netfs/fscache_io.c
+++ b/fs/netfs/fscache_io.c
@@ -237,7 +237,7 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 				    fscache_access_io_write) < 0)
 		goto abandon_free;
 
-	ret = cres->ops->prepare_write(cres, &start, &len, i_size, false);
+	ret = cres->ops->prepare_write(cres, &start, &len, len, i_size, false);
 	if (ret < 0)
 		goto abandon_end;
 
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 894c3305710d..5d9098db815a 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -199,7 +199,7 @@ static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
 		}
 
 		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
-					       rreq->i_size, true);
+					       subreq->len, rreq->i_size, true);
 		if (ret < 0) {
 			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
 			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c1218b183197..16252cc4576e 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -33,6 +33,7 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 
 	rreq->start	= start;
 	rreq->len	= len;
+	rreq->upper_len	= len;
 	rreq->origin	= origin;
 	rreq->netfs_ops	= ctx->ops;
 	rreq->mapping	= mapping;
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 560cbcea0c0a..cc9065733b42 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -280,7 +280,7 @@ EXPORT_SYMBOL(netfs_queue_write_request);
  */
 static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
 {
-	struct netfs_cache_resources *cres;
+	struct netfs_cache_resources *cres = &wreq->cache_resources;
 	struct netfs_io_subrequest *subreq;
 	struct netfs_inode *ctx = netfs_inode(wreq->inode);
 	struct fscache_cookie *cookie = netfs_i_cookie(ctx);
@@ -294,26 +294,21 @@ static void netfs_set_up_write_to_cache(struct netfs_io_request *wreq)
 	}
 
 	_debug("write to cache");
-	subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
-					    netfs_write_to_cache_op_worker);
-	if (!subreq)
+	ret = fscache_begin_write_operation(cres, cookie);
+	if (ret < 0)
 		return;
 
-	cres = &wreq->cache_resources;
-	ret = fscache_begin_read_operation(cres, cookie);
-	if (ret < 0) {
-		netfs_write_subrequest_terminated(subreq, ret, false);
+	ret = cres->ops->prepare_write(cres, &start, &len, wreq->upper_len,
+				       i_size_read(wreq->inode), true);
+	if (ret < 0)
 		return;
-	}
 
-	ret = cres->ops->prepare_write(cres, &start, &len, i_size_read(wreq->inode),
-				       true);
-	if (ret < 0) {
-		netfs_write_subrequest_terminated(subreq, ret, false);
+	subreq = netfs_create_write_request(wreq, NETFS_WRITE_TO_CACHE, start, len,
+					    netfs_write_to_cache_op_worker);
+	if (!subreq)
 		return;
-	}
 
-	netfs_queue_write_request(subreq);
+	netfs_write_to_cache_op(subreq);
 }
 
 /*
diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
index e5cad149f5a2..c4a3cb736881 100644
--- a/fs/smb/client/fscache.c
+++ b/fs/smb/client/fscache.c
@@ -180,7 +180,7 @@ static int fscache_fallback_write_pages(struct inode *inode, loff_t start, size_
 	if (ret < 0)
 		return ret;
 
-	ret = cres.ops->prepare_write(&cres, &start, &len, i_size_read(inode),
+	ret = cres.ops->prepare_write(&cres, &start, &len, len, i_size_read(inode),
 				      no_space_allocated_yet);
 	if (ret == 0)
 		ret = fscache_write(&cres, start, &iter, NULL, NULL);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 638f42fdaef5..f98deef22d06 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -263,6 +263,7 @@ struct netfs_io_request {
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */
 	size_t			len;		/* Length of the request */
+	size_t			upper_len;	/* Length can be extended to here */
 	size_t			transferred;	/* Amount to be indicated as transferred */
 	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
@@ -360,8 +361,8 @@ struct netfs_cache_ops {
 	 * actually do.
 	 */
 	int (*prepare_write)(struct netfs_cache_resources *cres,
-			     loff_t *_start, size_t *_len, loff_t i_size,
-			     bool no_space_allocated_yet);
+			     loff_t *_start, size_t *_len, size_t upper_len,
+			     loff_t i_size, bool no_space_allocated_yet);
 
 	/* Prepare an on-demand read operation, shortening it to a cached/uncached
 	 * boundary as appropriate.

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

