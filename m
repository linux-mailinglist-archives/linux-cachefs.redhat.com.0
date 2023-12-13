Return-Path: <linux-cachefs+bncBDLIXLMFVAERB24Z46VQMGQE4LTBW2I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B1811659
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:32 +0100 (CET)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77f5e12dfdbsf707429085a.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481132; cv=pass;
        d=google.com; s=arc-20160816;
        b=V8jSgQUkXgavJG5UYavDzN71H5Fahwg3M3WKJNfii/6QEYuAeh3KOenBF1j27nkYlC
         7yE6YI6smBsUZhZgYg3mjKsnEWveZkK30oRY+i311zXbBxkqjhis+6Nj2y206TjofnqZ
         VblKOyrCytBRT4lxBTnsX+g34LbrVXgMKUmdpw90r+UGmLuKBiyEN+55wYDl7vJ0Jv6r
         7Ubr7i2b7WTph5baZS6QUWJ2dGlZVZ9Lc8GFttcvrdKXvFZZEFIAZbz1+V7Vt/gMBMR6
         HjuWQ8j1cGuqAXTysPzknMs8Am22UCoPavokYxreSOV75UfITNZS2xzEcQpcpChFtT6O
         ubag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=JWf/fuIZn6jtYM0XqDqEesXwgu8+X3TEGI2rb+sIk3XyHBDpaRQi1CqyAKcPthR8iV
         RpjZW3KAtmC4t0BNkV2hrv9+isbDgUqt0uR3E51SJOWNnLiHIdkSqMdocyKn/Fc6HHQ7
         IrFb7rgbl0aswII5pM2rDiyzltcEc8v2Z8hzM3lMrbsLarhlGQFCrjE4gLOGG+bj7u8H
         RO6XLOxc/CQT/0alwV/IKyN1V6b4A7/Ml9icztCOYs6SH+f6awt+dVxrm2KSAgyZ5lUc
         E/f9ixh15knl6wapNrosvLpbZFboXJNOm8Lf/0gNDL8KEmN3DKzsSvbSXJqR8Ak5h7Fi
         gOhQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481132; x=1703085932;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8rrjMnI5rbtIW25FGeNJEnmWzdp389XoFcO+DQaysA=;
        b=rkvaQLMWO03Wui9aKPX3w2u6SqXMoI6lI62Ss6LZq+Ci1OA0iJIFjXFbYrJNvhMFkT
         PNZGiH3auGud7g4LpZOoPtg+LT9o+iLY3yRQyNrPOMOsfsqkOPMaUjgNANTsBCcbHPw1
         yYucyJUHIkWePsaVoc4GV0k2Ymdp9rr3m+VRjgG+PTHINrCmGGX3JxajhqOxXjLHEYJS
         2ieYxkpiZDbsk+llN6K1a+DJqLnQY6rfBxPcAzuHVAfXKfc4vulVBC4WYJ+zwYSKtTB1
         mQTpc693d1pEZ7tkcgEtLA/80gDSFBeNFvyWAUwMEkn5Si9ZbuB2uYNfQcshg5OaEuUR
         IAkA==
X-Gm-Message-State: AOJu0YyzAtdGKjq+BXd0x6lSNdhjiI6Zrpt+2WDuPz2bbYqAzl55xDK3
	uEm2Aj/YJjP32cvbGZmTfWL4qQ==
X-Google-Smtp-Source: AGHT+IFw7WytLfHk895n5NnXllBoLkaJZHL0P5Z8TsLzMDbHCq2yZcYQdM2+VhW6+4Py3xQgnD5IRA==
X-Received: by 2002:a05:620a:430e:b0:77d:5f96:720e with SMTP id u14-20020a05620a430e00b0077d5f96720emr14063210qko.15.1702481131751;
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:423:7e09:49c8 with SMTP id
 a17-20020a05622a065100b004237e0949c8ls553950qtb.1.-pod-prod-00-us; Wed, 13
 Dec 2023 07:25:31 -0800 (PST)
X-Received: by 2002:a05:622a:1191:b0:425:598e:11d1 with SMTP id m17-20020a05622a119100b00425598e11d1mr13105299qtk.52.1702481131122;
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481131; cv=none;
        d=google.com; s=arc-20160816;
        b=wnLfSiCinZIef6++13zR3I9iIDqMmZYK9miplayzhStBsECC9NvHQCjGmVuiJ1gcgr
         rT3exMSv5IL0RWGLlRPPuuPh3sCbr4IUUq7vWIjTYBB7nolTlw6ydSw0DOW6hVfGY+c4
         n/XPNO5Y19+yMm55SQ03GDgZtV9iyLj/rSmvfXnr9SgBZsbiqhjvH0RqQubIioHlF73+
         fhTpmnxmkIZ6q7iNzBCD8XaiNXy0SFvHSQoD+MYy4no4Ro5KtkI92VqDDWp8/m3ZVqsc
         u7jm3LCK0iut86gKl2Bo4yrUyuLHOdG/MBnQYaVYBqWKjQoGRUAWlz4je/6kv+pnr2f5
         lqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=i1NCs1wijkp9oudHg0v3ZW2pY0xP/Retx1SxWP1fmpE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=M/JmW0Z0kuL3PfN6aX/U1mI1jxMiKvxT+GkKz355g7DfQxSDqUJcDAvxpKOhO1RbRx
         fSuLD9145KN370/kuolKcVwJmajbuJSB2vNSv92aOh5JOSSYtPe7AGMtje9d7JXoU0yy
         6QBAVrEikkt/B0bPSX+5VGDNS5AkOKJ5VyqZlDDd4/PvbSaznqny9gSBcJFAaV4xBSqZ
         tlQFIWaNMXVW/wcae9xXE06U9IFcxmZ70xHT6rmcZ+fCj6kj0nM3kmYjiCSKt71QeFt0
         d1oqImKwrZEx+RRMiIGmH/HDrdHxhgTXvVNgWu6OrjYdAhA7Hj9D36dhCjxwkjpWo68X
         aQ2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fv14-20020a05622a4a0e00b00425814dac1asi14736128qtb.246.2023.12.13.07.25.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-TWmM-pN5MaCBI_UTaM6H2A-1; Wed, 13 Dec 2023 10:25:26 -0500
X-MC-Unique: TWmM-pN5MaCBI_UTaM6H2A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3D99100815F
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CE04A3C37; Wed, 13 Dec 2023 15:25:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 174293C2F;
	Wed, 13 Dec 2023 15:25:21 +0000 (UTC)
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
Subject: [PATCH v4 21/39] netfs: Make netfs_put_request() handle a NULL pointer
Date: Wed, 13 Dec 2023 15:23:31 +0000
Message-ID: <20231213152350.431591-22-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

