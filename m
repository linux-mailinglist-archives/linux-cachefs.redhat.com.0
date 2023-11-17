Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQFQ36VAMGQE63HUTSA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A127EF982
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:50 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66fbd02d104sf28005556d6.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255809; cv=pass;
        d=google.com; s=arc-20160816;
        b=ry30AvkdqsJj9nb/KeSfI/Vb9AenvJ5DglXrM7FMrZPo5mgq2shvyCEZ/YdDROuMoA
         NibUtKVgbapn3FHDRrfXw+xaa6MbMpnVFaXSqw760EtEhnZGu01X+L6jPUUihI3OQze2
         P/7UgVkkYvbRM3HSjhr2rcTJ4x8YyEWF02d+3ugHUpggMWO2Mudv1frKluii2w98ZMxt
         FSFnGIAuZQgZ4lP1yF4iT0YqXNlUhgmZh1PaRo1jP/2OMVq0Ml1anFho5v+jcITKalqf
         oDR6l2/k9SsH/A4SaCMcBkjEHH8bGAL5JONqPFowpugYe1xpCNWiNkztIXb0yjSlH0Cf
         khIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=AInD4TST8LRNXur0hUYH+6SQCLIwhaZc2RT3DaMbevkvt+FjwQOurqFpi7sKRs3ha5
         g+0/3CFGKXnnp4xLuEIPCQxu/AaVhY6UMIj3WHhArfafsCvByFh+zmdJCK7acWu65nk7
         ngruN22oehWSR9QBxokucVFqJwwkJ7YN1AnB3ZKVK/XWT4O5UO3k9yCwuQR4m6SHyTVt
         3moeuEcPvT/gH38oHUkrtMNqNe/Gao7oDcfjhvSd8arKdAfozLB+zUfpbBQgABvg7mIb
         EH5YDrPny8WaC6BOX9rVFm2a6BHKBUTFlHUx7/0hmK39XGyFvQWDD/iIF9YZLGwlJ66F
         p3WA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255809; x=1700860609;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        b=TQ0A8/vFovmZTVMxRT/W/rBIL2BHf3P0oQhuMMg69DaGt5B9zsfydMNQYukoVIRzLK
         i9qhOr5OU1lTIdQIc+ivWrAXmd9+1bTeoK0G1d/6XJAAlyj6eJPHGIp0XQ2obQf9val8
         C+OYbCp9Pe2Edw7G2WaNgqvUmPcaCEHMTUQDLKWNzQLFsWliYu0q6n5dvGd7RNg82ftX
         jtyBBT7pQyFHiJK/v2KDNOkQUVOBFeV0fGl/qxpjGVTnkudlUwwCLnpaqhpI76E0Ug99
         U4VCaUEs5K9bWrjjU1PxDmOFdgM55RNQwr8oQ2aTSZ1HTkCrsg9TLprBxLb4VezSvnuT
         LGgg==
X-Gm-Message-State: AOJu0YyjmqmFi32rvm6Bt4q9FNfZkd4eJzSzq7OdOEfRlExDyJcWA3M7
	yQhQ79HdeEUqj/P0Xih2LfLs6w==
X-Google-Smtp-Source: AGHT+IHc5dIjSU5WCzgTKCJXKcOXfR1HkS2mQu5IPSl37Hiljz3hNoJHOOb+0f1bsUIruc6N4uLVUg==
X-Received: by 2002:a05:6214:5194:b0:66d:4191:91ee with SMTP id kl20-20020a056214519400b0066d419191eemr294196qvb.51.1700255808957;
        Fri, 17 Nov 2023 13:16:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e787:0:b0:677:e7da:9886 with SMTP id x7-20020a0ce787000000b00677e7da9886ls669547qvn.2.-pod-prod-05-us;
 Fri, 17 Nov 2023 13:16:48 -0800 (PST)
X-Received: by 2002:a05:6214:48c:b0:66d:5d31:999e with SMTP id pt12-20020a056214048c00b0066d5d31999emr342753qvb.43.1700255808456;
        Fri, 17 Nov 2023 13:16:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255808; cv=none;
        d=google.com; s=arc-20160816;
        b=kEHilbc90bUZci3pmu8UxMp3Jw+W3X4oxMUFE5TvmtX2D6mutcifURlvgpLYFB5y9H
         m2sHBPUjSTs+ngSFq/HExo+O3P50k9oe8Ssn82pX03+SWb0T0qtgPG8nB2+ui7D2xNWb
         J61OCvppKkK68J8lLJtSTjHAeOvUn652D8EQ25cQY+BO2MQ69aokhZ+go3raZn63+v6+
         wKRQT9KHLhSo3dDOC8dwC+8AafbgP0l/jVaUgp1ytGSSWpsWVqTC+j3Jdc65rAfK8fIT
         uJMRwDr/MH/6hiGGstOez9CjKJ4pweG7kZtns3DElOk+GG3dYoCbyaq+11aO8fB+0OBG
         +0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=i1NCs1wijkp9oudHg0v3ZW2pY0xP/Retx1SxWP1fmpE=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=J3djRB3gh9+9/CKMmv2o0Bwqm5wDvjKah26CF+BS9Bwn0S23BbZ+lhwZGA1gNZ5D6d
         6WwPC2pTNG9hPL53NMtg3K70Fx9pwFDItACKX9q0KOa0WUZ6KzyVitvGj/3NopxHxZkC
         Ir4CRMU5i4V80Zvn09DHFcL5w/5KiArRUEp2/t4omCCgluzKsPuJe0VMmBqd75+Tk6xD
         qeFlZjxwHsUXGjN5JZs2TXtnjSRygswrea3U3vO9bTQ4L5ObMlOMyOY9ZT13/30cVjUo
         1iV14iSRfLGATsFdpIKGKQUs10mX2gjK9EKMk5r4rXUV5mklJRLIEmsxUlBz40LDNvB1
         liPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id m11-20020a0cfbab000000b00677f81c965esi1634905qvp.141.2023.11.17.13.16.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-KGk_tjjeOcaJrC9geraI3A-1; Fri, 17 Nov 2023 16:16:46 -0500
X-MC-Unique: KGk_tjjeOcaJrC9geraI3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9603182193B
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 932C140C6EB9; Fri, 17 Nov 2023 21:16:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2A8040C6EBB;
	Fri, 17 Nov 2023 21:16:43 +0000 (UTC)
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
Subject: [PATCH v2 17/51] netfs: Make netfs_put_request() handle a NULL pointer
Date: Fri, 17 Nov 2023 21:15:09 +0000
Message-ID: <20231117211544.1740466-18-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Make netfs_put_request() just return if given a NULL request pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 7ef804e8915c..3ce6313cc5f9 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -109,19 +109,22 @@ static void netfs_free_request(struct work_struct *work)
 void netfs_put_request(struct netfs_io_request *rreq, bool was_async,
 		       enum netfs_rreq_ref_trace what)
 {
-	unsigned int debug_id = rreq->debug_id;
+	unsigned int debug_id;
 	bool dead;
 	int r;
 
-	dead = __refcount_dec_and_test(&rreq->ref, &r);
-	trace_netfs_rreq_ref(debug_id, r - 1, what);
-	if (dead) {
-		if (was_async) {
-			rreq->work.func = netfs_free_request;
-			if (!queue_work(system_unbound_wq, &rreq->work))
-				BUG();
-		} else {
-			netfs_free_request(&rreq->work);
+	if (rreq) {
+		debug_id = rreq->debug_id;
+		dead = __refcount_dec_and_test(&rreq->ref, &r);
+		trace_netfs_rreq_ref(debug_id, r - 1, what);
+		if (dead) {
+			if (was_async) {
+				rreq->work.func = netfs_free_request;
+				if (!queue_work(system_unbound_wq, &rreq->work))
+					BUG();
+			} else {
+				netfs_free_request(&rreq->work);
+			}
 		}
 	}
 }

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

