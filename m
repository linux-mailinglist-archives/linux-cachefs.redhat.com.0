Return-Path: <linux-cachefs+bncBDLIXLMFVAERBO7TYOYQMGQEHT3TADY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id AF48B8B77D2
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:33 +0200 (CEST)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5ad0529f9c5sf7762201eaf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485692; cv=pass;
        d=google.com; s=arc-20160816;
        b=PUym0yK8Wesn/Xl93rhuiP+g8Goee+vd1jSWdtgAZBDxp4pSxfaQNhgSIv/We40cWI
         9y5vdJLqQN6y69ckogH5WAL1Ihi0p+w7wRMgJOmy+5H1qOKSnzUKGLtKIzaPok7rYkZ5
         HMWSQGKgR3yKJwY5fk7TtcmTOsWZ2mowg0iDxhNqEbbAw3c5fXzV+AppsWXkElISWO6J
         Cb/vzo3xABk5p9b86wiwZb6shbZ9tu0eEhotlE3RRqJTJH176CurtiVkQQVON/UKC+iR
         0D026/3tDvNjLNYy/6JZcUTzdhX1/HIB84M5D1zAroqvoZe3gVKn96gz7Y8TdiygIJRq
         PHmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9aFwgnzhtJVROuLhnSJwNG3ZceCT8NIcIKLLSqmbNY8=;
        fh=c4PK6ytqLWet+C4VlbXq3dCerxi2/E4VcJt81JSySjg=;
        b=ZAqg0Dgp0JCdjlcKsA45H1kAnOCKlLpKXAirq9T0F+JaVSyyqqCg6n8zRtk9D2nKDF
         JkBoq5eMiVW8ZBEw00B1S2AZ0AgwGofXbIUkjeBUD4TgPcvr8nfCveMGBGT0K3gMhAcI
         tgbjhwBJiF5QfQDKcSIwNzbnSP+JRNpdr191jdDcHaekop3Kl0WWN0YMGC8qczYenxpF
         HLk2KnS8lDQcfICPrYljFC8QkQ1GR09Tj6Z/1StRLQwXZ3PM8rywvLRiLu3v7YZNjYkQ
         VPSaDUpH0P5LRVMGBvxMqM0mnkzbHuyEkOcZFqloRrW2cLDWUKu6zOmjjbOLBpMyY55Z
         iQUw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485692; x=1715090492;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aFwgnzhtJVROuLhnSJwNG3ZceCT8NIcIKLLSqmbNY8=;
        b=mUoI+A6FW0/B4KBV5EJ5yysP/PHCBBsKAgy7PC/DgHe4tNS41+f1zQ3DjtZuC+U/3p
         YS+l6Ty6uBDxgR1PUnIso0mi0rs+xIrEjAHJe+Sgq+6o6iI5dSRZUo7sMtS8aLa0rV31
         xCne7rMwEAgXJPdPG2iZFt5BBpwr0NyLwI5LA6PCZeUghpt+56b5ZSlIuHbLp2NOp059
         ZL2zD2uH/8iDFPE1RP/5m7vEsSA2x9hjVqohX8xIMUlSJUIqtH+GUJyhtZwQAv4ablMH
         a3INQofFz24oYx5TplJHpPcHHDzwxU1sXBsjYgGv2bfvb7P2nSBAQSH1pubCSiz8aQJM
         KB8w==
X-Forwarded-Encrypted: i=2; AJvYcCX1zN2u9bYtGRCt1D+OyDKrGLyhnmghHsAlaAJaxWOsyi+i6Tqkc4LmdkVmf0itDCVMRa4A8ZDpzDCzY0O1wvc0vUSYUdb06rTzoQk=
X-Gm-Message-State: AOJu0YynthbZBUVK7JyZQfIMwqkffrQaivFrOPc2x9lTXus2TdnkgIl0
	dzjUpeCyY5YVKsOZ+yWEEhp5kwE9xQ2YHRnFrgsdynFOFspzUJjB8vq0w3f7IDc=
X-Google-Smtp-Source: AGHT+IH92UT3MF2tqh/DzpxJcl8SQiZ8J/1LiIQWDyYftDiEijYxYhwoPkV56wGbrktB6wPtCKMegQ==
X-Received: by 2002:a4a:d6cb:0:b0:5af:73be:81bb with SMTP id j11-20020a4ad6cb000000b005af73be81bbmr15190974oot.0.1714485692101;
        Tue, 30 Apr 2024 07:01:32 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:2206:b0:5a4:5fe2:2211 with SMTP id
 006d021491bc7-5b128b15312ls605186eaf.1.-pod-prod-07-us; Tue, 30 Apr 2024
 07:01:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUICJPjZF9vAohwJgPjK44Bu/Fb51iVTPgR1KU7uMybiSUxXCEBqTbuSGCMYXjqjGtBW/WpiPAJhfcaLhiabaxRDBNyui5DiP+C+SNxAjk=
X-Received: by 2002:a05:6358:9295:b0:186:3fea:b69f with SMTP id m21-20020a056358929500b001863feab69fmr15699563rwa.21.1714485691081;
        Tue, 30 Apr 2024 07:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485691; cv=none;
        d=google.com; s=arc-20160816;
        b=TBesA/kYKHnh8ijDHuB01zvwdrOjeWvtxeQwd4cpLD1zZCabXhnZSUFpWgYGt7RvKe
         xlISckmc6HW4EICiwAz0wBDhCs/vLae6pAqH72yGhznKDZt8JioyvduEh6XNRxGIRmMn
         HA48B0u1Qgqrx51LP0J07SSRiJMjrOYrhWbdioA0V2CRvDUlak4DwI84LtmxfVvhz7cd
         rlUaJZG/lPz5bhVQ9WgEtKzxu66whgbHo/OvMtOcecGedSq/WKNfSxdFr5Pk/W36WvFZ
         cTQuDz7QG+Ztil+Sp/e+LV4J1TGNw/sHiEa6w72gYNxTK4EzBtpf36adp232t82PTPjK
         NMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SL4EWbx4NBAGR5Ppiq2v7C/YTDepZ3O+7v26rOrM0n0=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=xPkHjt0CM11xEFAObByMCP5CkTC22e4ueRmbTNkRAQ0XL91eqAZ+eHCBI/A6Gv//AD
         NqwQwHS4NBK2SuXN1UHpcSXvC9qeZdwfo1k4bkp5BDCX68JUDTaABcR2/F7CjDN32A9y
         qxQxT8q+JWmNytVTRK0yQsh6dBhA1sA4agCAftlDO7PR+QcZ9EGecBCpOyHrlM0ZwCyV
         IGrlP3+V9T0Jms6Gid+GcjkhwirW1jYIi9JRHfWT41f15T+SxdC0+Z0EqwTWUAPH5dMk
         j87MC87MmJa4bcPlWOwHSq6VW38pyUcDsBl7OCqILV4nfhrHebvuTMQDsX05h7iPhgkx
         Rf2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id ba32-20020a056130042000b007f04146486asi946602uab.95.2024.04.30.07.01.30
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-uR7fGHp4P3eqeB6FOYp9XQ-1; Tue, 30 Apr 2024 10:01:29 -0400
X-MC-Unique: uR7fGHp4P3eqeB6FOYp9XQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D683518065CE
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D39D1112131D; Tue, 30 Apr 2024 14:01:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BCF51121313;
	Tue, 30 Apr 2024 14:01:24 +0000 (UTC)
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
Subject: [PATCH v2 06/22] netfs: Use subreq_counter to allocate subreq debug_index values
Date: Tue, 30 Apr 2024 15:00:37 +0100
Message-ID: <20240430140056.261997-7-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Use the subreq_counter in netfs_io_request to allocate subrequest
debug_index values in read ops as well as write ops.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/io.c      | 7 ++-----
 fs/netfs/objects.c | 1 +
 fs/netfs/output.c  | 1 -
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 2641238aae82..8de581ac0cfb 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -501,8 +501,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
  * Slice off a piece of a read request and submit an I/O request for it.
  */
 static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
-				    struct iov_iter *io_iter,
-				    unsigned int *_debug_index)
+				    struct iov_iter *io_iter)
 {
 	struct netfs_io_subrequest *subreq;
 	enum netfs_io_source source;
@@ -511,7 +510,6 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 	if (!subreq)
 		return false;
 
-	subreq->debug_index	= (*_debug_index)++;
 	subreq->start		= rreq->start + rreq->submitted;
 	subreq->len		= io_iter->count;
 
@@ -565,7 +563,6 @@ static bool netfs_rreq_submit_slice(struct netfs_io_request *rreq,
 int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 {
 	struct iov_iter io_iter;
-	unsigned int debug_index = 0;
 	int ret;
 
 	_enter("R=%x %llx-%llx",
@@ -596,7 +593,7 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		if (rreq->origin == NETFS_DIO_READ &&
 		    rreq->start + rreq->submitted >= rreq->i_size)
 			break;
-		if (!netfs_rreq_submit_slice(rreq, &io_iter, &debug_index))
+		if (!netfs_rreq_submit_slice(rreq, &io_iter))
 			break;
 		if (test_bit(NETFS_RREQ_BLOCKED, &rreq->flags) &&
 		    test_bit(NETFS_RREQ_NONBLOCK, &rreq->flags))
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 72b52f070270..8acc03a64059 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -152,6 +152,7 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
 		subreq->rreq = rreq;
+		subreq->debug_index = atomic_inc_return(&rreq->subreq_counter);
 		netfs_get_request(rreq, netfs_rreq_trace_get_subreq);
 		netfs_stat(&netfs_n_rh_sreq);
 	}
diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index fbdbb4f78234..e586396d6b72 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -37,7 +37,6 @@ struct netfs_io_subrequest *netfs_create_write_request(struct netfs_io_request *
 		subreq->source	= dest;
 		subreq->start	= start;
 		subreq->len	= len;
-		subreq->debug_index = atomic_inc_return(&wreq->subreq_counter);
 
 		switch (subreq->source) {
 		case NETFS_UPLOAD_TO_SERVER:

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

