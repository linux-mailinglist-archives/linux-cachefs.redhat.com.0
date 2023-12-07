Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTXPZCVQMGQE7YVLHOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB6809363
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:27 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42388d6a561sf14741071cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984206; cv=pass;
        d=google.com; s=arc-20160816;
        b=YTOfnhUc0OpzFY9Lqdx7ek7tG9aBZawvcyVCLG1SWcrxzZ4hcEWuEWsJIYw32zcwWZ
         ShTR5ZUJdi2nnZ932jghf38/WrDzuxCdrHMpmTB6FjHgGiLk2wZKXjNYV9y8jvmjyanO
         Wfj38RDYFf7fgirVLMSPU+Ym7KR7ZFs1Jdfu96CqkT9wC3A+7aTZUd0ZFwW5OXeOUHbP
         OLrHBqd/KO/shdm/5T0sFcPL2CCjUAKh9Wx3QFpk7jUtYC2qVjOg+2x3fjlP0dbWXLAS
         2Lu+yikkp5dvz9D2F4AvawiqHUuDL7yOcNi+sdEzvtsDDnquLZOy89QeOcoLgdHLwHeQ
         xkKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=HZg9oUUMIbgtYFMEJuC85pbzoRcNQN8zQMn92+xjwFIWKfwJhdnE53lrImBDUKw+vk
         y+sajcL0KT+6IW5m8NxJqSmpVy3Q4hk2LAN+7dcvyinxOAROS4Pt3aNW5wWeFzuBExs4
         YRBn21dnXF+T4minFrhH6wMpQS+kfu3xPkbu859QwvqxjTgUFX1gpb7j+2yDuwoS5jgz
         U6iX4UU7nvqDxzkT1X/VyvaTsLIoNwZr0fnr5KYct+Fe5YknJd9bYbNRlE07keVyhIRW
         A/XnSt6wtM1rEbgNjiOE7E6NH54tR1EXPagOuYyCjaq3Ft+M+HAaJsYmAOPe5vBchSEj
         lY6w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984206; x=1702589006;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        b=oa3OSbhT2IY2ZjGnUmO7dutzLkNkPrq0Q4Xo05lHGBKjHnenq5qwtgwlLwNVgIk3h1
         4h6ScyWyOz+B34k2EfG28x3sLisBurG2XoHXewqw9SF85FjT5hNgr/S6p6UjetbHfOWz
         RlwzW4oBD85G7HK9uQGCIjHZe4paHyJtgDEBhjdcUblcryZwNoyTY0oEJ2bOWOzPuVcq
         JexYGx2yXMFZyUpKV+JysFm8KoOPP4lMmnmVwbqOU7JICpSVrm8Z/6K3HprWbCpmeEcB
         x3ME5Hfl1JwtjGk1dNrDRLR1nxa/zjuo3F6cjLpqWGlFzjw3FrCieJRph5rr/nKcpZiN
         L1AQ==
X-Gm-Message-State: AOJu0YwIffb/deL9QtGZTY84fZRchvXZhlVmyxa6O2rK9pM+VS3ybw0y
	Yd6phE1H1mqCWzfXT18HIr2Niw==
X-Google-Smtp-Source: AGHT+IHaEOilBWcMmC7Qo7R7DQWIKDEJnxQbgrT9Cgw07FokoLpgxJPiXeDqrsnEgwbkNuA+iBO28g==
X-Received: by 2002:a05:622a:2d2:b0:425:91ca:31ad with SMTP id a18-20020a05622a02d200b0042591ca31admr1622041qtx.9.1701984206713;
        Thu, 07 Dec 2023 13:23:26 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:425:7ea5:45f0 with SMTP id
 a17-20020a05622a065100b004257ea545f0ls1591464qtb.2.-pod-prod-04-us; Thu, 07
 Dec 2023 13:23:26 -0800 (PST)
X-Received: by 2002:ac8:584e:0:b0:425:9cee:dfb5 with SMTP id h14-20020ac8584e000000b004259ceedfb5mr174637qth.96.1701984206258;
        Thu, 07 Dec 2023 13:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984206; cv=none;
        d=google.com; s=arc-20160816;
        b=Dd9E84iSDdGirKe0P+OdIJ7vacyokS3BB+oqnMofgV074o3JFj6t6fY5OJawCaF4Os
         QWiEim7GKP5VUjlU6qD09grOYEQnNnwvgtSEgEoF8yoeNsC4kIAeVy4EXuNMWO7jRXCE
         rRT+DPecbfCdlBthdpWcx+3PPLwW5w6T6WNH1hXTKwRR3ClPGefKzh94Ihmenbu+KADX
         flUGW9FuMPghNkG5MhDi/YNMGBTzsbh1ku3rAIz460was8OEbJ7jPKk9+Vvy/A04FGqS
         /00j0R/ltAEzJu1hxSmNrVXvOVpsdc6MRO5Pfd44IbVnkMJm6DCdkjS+C04H9iU8pDN9
         TJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=i1NCs1wijkp9oudHg0v3ZW2pY0xP/Retx1SxWP1fmpE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XV9KLMC2MEko0rl50WoQ66jYZn4xPjoBNLFzdtfZVMbOgTPLd9X/l8DFDFsp23Agmc
         ASf3jytp7wwvrm5BXd9W43oe8G5lBQstYq74usW0LPTxnKJcVJKsdMG9isnQIZKHts2D
         9a1h6W3mNM0c7uQY2HEN2HP/P/zkVtiZFmV6BNC69aBIFoU4wgHeWDCQazDQ5ni7Z310
         cRyrbe1MKHBUqUKgR5DMOshUoJNzQbfJ7AVkCWYgpCRM25AIOgUkir6VFBh4hgJwaj7Q
         p8xgI/ww6U1Qr2ZHuqUZnCvw6EAbPVkmBCc+wA7SApVe6nZSNEKORk1rxPs2Ju93Fplj
         x0Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b9-20020ac86bc9000000b004254883439dsi558972qtt.685.2023.12.07.13.23.26
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:26 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-gtmDK1yWMReBAkZzU_qRog-1; Thu,
 07 Dec 2023 16:23:24 -0500
X-MC-Unique: gtmDK1yWMReBAkZzU_qRog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7281B3C32068
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6EBE92026961; Thu,  7 Dec 2023 21:23:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4FB72026D66;
	Thu,  7 Dec 2023 21:23:21 +0000 (UTC)
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
Subject: [PATCH v3 21/59] netfs: Make netfs_put_request() handle a NULL pointer
Date: Thu,  7 Dec 2023 21:21:28 +0000
Message-ID: <20231207212206.1379128-22-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

