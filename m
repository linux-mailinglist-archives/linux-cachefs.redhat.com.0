Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSHZSCWAMGQE3TAMS6I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5881B76A
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:30 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-59127d45e36sf826767eaf.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165129; cv=pass;
        d=google.com; s=arc-20160816;
        b=ovX8FMpCl89GeXczISH2a2k+Vk525bVvsjBVrZoVSzi8/Glu8MR5uXO3fYbKicgaA2
         O57PTM28iCNj12PQJ5JtNgtVC5aTMPQn1bPgXqi1ZXpuTB1QgmcA06lyPbgpYKccRIWa
         5nUJCAztIcpoNf/7PkRBgCr2pUq3uJ6skao3Hv5C2ZhEUr6Ps4JTSKzAPoFOPysD8Yoo
         +kAvxxID5CE7xHXY8XqPbXDhTXATHzpR/yFcxxK0i9jC/5qIQg/f4HZhJqXVxwXrhZpn
         SzmFcfpTpwO5NRSnWIdRKheZEedVoZmZ7Il+pr+haCJpzrbJcgQ+36rgQyIeqgGCJrJZ
         H89Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gi6PoKt/vU050WCGNhgF3CT4FStqFjIemhag+BuzMig=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ZdvXuOI5uGqgJyPayDP2ib9CPVJDixvnS+eAV0BT+UFMCjcK9hKkMg9NuquscMEQYE
         by7qgDa5R1fpGbn7TxkjB7w0cOf1+YVNw2m0t+BmdXCehA31aDuKxJh69tJoYlg1yvFs
         u6dR0nKT8Qg59Jr38i8S8sqlJObvSxB+2MxbR7FwebvCXMerQHeuh3UYzXqViQSRF225
         K2M5ToXKXqnpsmVf3aJnBnz/6RIEl9uxlzukw+OY3oaJK8UkQUPcwbrQXv9sF6UrbLIf
         nEtFnXNnYlXe6VZ7kW0M0jcnZL1dBCHFHj4QRCykfRdP+T8eMEpjAD7jUgywUdECFxZO
         kayA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165129; x=1703769929;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi6PoKt/vU050WCGNhgF3CT4FStqFjIemhag+BuzMig=;
        b=Bse5Z4kYmJ0Ecmd0YFA0E40UOk4QuSifhFVBCDJSW56FYwb7YY7QTbKMYWe/L3Q5Os
         3IQ+0uQ0SPtm34HYa096F5XQWgbvpXWtbQ4J8x8n55P0G/Yb0ICDXP3MxV8DZbSbbpaG
         cZ1qtGQGGf5nnYK1GD9tJ+ax/68RXmti/gCZ4kzhdqfivSBfPLa5U0WcefePKCwwpkzs
         PjJR5kf3T52U9/VOmxOh2sCjDNldlezl277tEXMb8GWO91ZRe7jOoxPaatGFE9Nce+bJ
         e14IDVyksHFM+TO04A239TCN4wsXZjd6b0ZxENBvAfnjZ4H46oR+3XNn2cow8aN4LB1z
         Aecg==
X-Gm-Message-State: AOJu0YyKAwO6hJzPXF8WtzCkbs3XjDDCF7hbc038PznZfGDTorHUuq2F
	DvjOCQhfz6D7lFLpdTtzEFRjJg==
X-Google-Smtp-Source: AGHT+IE5AzOHcAEP+odxqNQkHKPpjuwnHZN/5f0xfoajbZOXQbbU8GrXFRU8xy7A6FUA6r6RbS5plQ==
X-Received: by 2002:a05:6871:707:b0:204:3026:3a4a with SMTP id f7-20020a056871070700b0020430263a4amr919362oap.17.1703165128887;
        Thu, 21 Dec 2023 05:25:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:9720:b0:203:6edc:d5ef with SMTP id
 n32-20020a056870972000b002036edcd5efls659416oaq.1.-pod-prod-05-us; Thu, 21
 Dec 2023 05:25:28 -0800 (PST)
X-Received: by 2002:a05:6870:355:b0:204:2ac1:87ee with SMTP id n21-20020a056870035500b002042ac187eemr1230616oaf.105.1703165128318;
        Thu, 21 Dec 2023 05:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165128; cv=none;
        d=google.com; s=arc-20160816;
        b=SE4KXvHqp3gbiHpAlgyDnrRpnPlZWs/0015MRN2xGaUhudqxV4Ma9fNkwy87widIUm
         d985Pf43goHUCd46dAAnLUVbpkqkilcM+m6QCoNPBLPIdDR3+3PAEnNcsgQIu1lTKz+k
         S2/YbSKuA7eINvuN6qXvZFMrpFFWRRe4aZdOIKfFH3RAbp0ay5mB51H6LIjz2MrtAM9i
         lFTr61Pi26mGIhv7/sEXGrhrrubt7XgZI/Z/0PF8GG10Kg7hPS3bGFwpXvDKcEN/d4YX
         dJ9b8/T4J4txrk5oFWeFyizJY2GPrzGfe8w6c95H18r3p0dgB2gie58qCJC5u3YL2DT6
         QsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=U/y+xm2N9V1erDz4QIGlE5zRDPNtyRW7a99pDjZCrtc=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=RTxDGlv6RwS5NLxY6eDl/+mm6ET00c6q4ZTsoXr+k+WuXTUUtAvzD/0kVhJ8xr6jWx
         cTaAh7zy2WmZf/FoUjjjCDgdh+PTXh04s2UvG4kS5E3zLyxSAHW05LTR8wm/V15SpgSI
         ZghxUAhRjnSDkezfmmx/N4dMLsnyGG3G6epK5pyskL25rUmLHQCo60iDedPkth688dNd
         fEcVpA1AV6Z62pFNWN8Dpm+MH8cNI7JprW0i7IaNPgArk0czjQGACi2jYr5AziDj2BOO
         UAHROF+Dnk2RMpgBRp8rasmRkfku4vZWLJJADAxwF+OIsjZvO5jXPwxIeLOiEx2eVAwx
         5Q/w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id j18-20020a05620a289200b00780fede54dcsi2205759qkp.449.2023.12.21.05.25.28
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-SR-Tc-4cMUunX9GAOsRKfQ-1; Thu,
 21 Dec 2023 08:25:26 -0500
X-MC-Unique: SR-Tc-4cMUunX9GAOsRKfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505FD383008B
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4A5E95190; Thu, 21 Dec 2023 13:25:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6425F51D5;
	Thu, 21 Dec 2023 13:25:23 +0000 (UTC)
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
Subject: [PATCH v5 21/40] netfs: Make netfs_put_request() handle a NULL pointer
Date: Thu, 21 Dec 2023 13:23:16 +0000
Message-ID: <20231221132400.1601991-22-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
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

Make netfs_put_request() just return if given a NULL request pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 65a17dd4ab49..3aa0bfbc04ec 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -106,19 +106,22 @@ static void netfs_free_request(struct work_struct *work)
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

