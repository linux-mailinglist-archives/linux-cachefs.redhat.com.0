Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFVZS2YAMGQESDUKYKY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EEA890565
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:36:39 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-698ec7485fcsf1288606d6.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:36:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643798; cv=pass;
        d=google.com; s=arc-20160816;
        b=HmBh6oGmcYTDtOePmSk7En3JsRj6htAXJxGmFzNs2V6Wt9sFxe1K+bBc57JBuFSWF5
         IP983ldqTSJnyR66mBIwPcddif5E4XXGYwF+ZlOlV1bS2thN7cMboT2Y3Ukfe9Tk69Ip
         Juf/owI1Ls08e08IuKBLdB4jddd+vMmqhvWDOcrQj1TLCvh/5HePWE/F+sPVlcP/qeAv
         Z8BT5ymwJ+1c+DDU4r+tcpnIYvmihVLYvZrKhIVoWd13Uet57fQ41t8lTPIqnw9HgvwG
         WtA5tdGo75KHchlbXL0wNAKKSiR3uf6j++DmdEf+BeL6pLQM7ezgcOyD9oF/wH3+zmVv
         2l+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=nROyV+AwlTsoRuP6eIVtII/3dXIpPcSsrgsrcp7UGbM=;
        fh=NETjeUJmYuIsSIFxj6L/L/ZRaxjAbBpRi+r2bhXluzc=;
        b=JeqXoF1sYt6/isKuG9cKC7DLl3Snsv3CR9myWhrshMSpam7YcmlX4nWpWl5JSDGfx9
         lHxcpL5kbk4gwO8Yj6Lam29KpYL/fhGm8imvIHlXmIUY1vYg8kUUH4C2HEEsPCnJjzHa
         FjSlPVy/TZIDKUl182tkqLvEF1WtslKuvGUfvWh9FSwJAmeG6wCAHV/pUc9ZEyIqmVp4
         5Rz78gv/b7ni7WYuYiTm7MLIP+gAb+T6BqOiFJWb8ZjlTFzFpl/N0iXWEItDJ7FXg/zV
         KEMV5m1d01n9Odc15oPKL8vaTG8D7+zAEJe59TSf7LWbR/sx13+Huxh2tOVWd33ne9/E
         JWXw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643798; x=1712248598;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nROyV+AwlTsoRuP6eIVtII/3dXIpPcSsrgsrcp7UGbM=;
        b=vm60LxwA+cQlOehnGEFo8zAnCLCUiMtza0O951LtvwLHmJ5XxKHC+j0YQ8M+A3S8MT
         QXMSv2NL/Mw4xRdoMTMd58osq9Msui72jHydDGzWPccm/13mgPeUu4rlMotfkC9tMul/
         glRFr494r7OH+kP2BSxqEW6t6Cp0n4QTmow+HSn4ioYB+AUvyYJnXDKsMyNZ3Io+bdzW
         rSBJPiOx9NNFjI8xiXjmOtTS6GCLCVuKgeiqxpkZhpDeObNmyLHRypAV+NruvZGroT+a
         So/Yk5qGl+sS6Qn1T5YxQsrqBZYyzohEvDnx2XyfJqm7dahIMcb6nMLwUD/8QXynOAOL
         mwHg==
X-Forwarded-Encrypted: i=2; AJvYcCVO6owaZSW4tmH2Lz1euZPcYO+8hb1/CjyEXKZQt4OwjH+pq8f86FyKbwDjvZ3EWMJRFapHhD/oOQuGGCSh6Ci4R9z32a6adCY8wwY=
X-Gm-Message-State: AOJu0Yzu19CYKiF3PkeZQ4Cxobd+xrigSPHg0m9gwuUJAKxezvVn5lf9
	lbdNmHt0grOWcBFH6TwaQthbFTRxMmjXCnn10D5kQuK9mRJNdeB6/cwE1Zh4iRU=
X-Google-Smtp-Source: AGHT+IFJ0unevzFapGCQR0Ut69CScadLNB0P2NPe4ZhucUv/eXDXKGrCfwrc3K5P38kZ2PTPO6/SGQ==
X-Received: by 2002:a05:6214:9c2:b0:696:b089:9d6c with SMTP id dp2-20020a05621409c200b00696b0899d6cmr3040337qvb.52.1711643798540;
        Thu, 28 Mar 2024 09:36:38 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1d03:b0:698:ecf4:6ea5 with SMTP id
 e3-20020a0562141d0300b00698ecf46ea5ls21230qvd.2.-pod-prod-06-us; Thu, 28 Mar
 2024 09:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVc3J6ZxZgIBh7gy5Ac1iWNN1CT9mSvE9Pqr6oaAbugEX8gpqBsfzCwyctWVBiKHx25E4xl8d6WJe039a+Gh/ld5i+M6jns74Nxa/AWYs=
X-Received: by 2002:a05:620a:43a7:b0:78b:c490:9a70 with SMTP id a39-20020a05620a43a700b0078bc4909a70mr906256qkp.27.1711643797925;
        Thu, 28 Mar 2024 09:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643797; cv=none;
        d=google.com; s=arc-20160816;
        b=CH1lEhEnGYmnbpevR24fxVGQbf0I94rq1CRAT6SZxOk+y48iOU4+JLXarUS0Xdg5KN
         5E3LTLrzXz2wpurTCAm2sfskdO2JuamoWj1HsV8GLkta5Dun0UTLMBqRsZJwRywviFnk
         zrVfAqvRlu/KQb7SvSrrxPibTo9mXmuH/dTalawSFmn1uBJBSzfe+Gi6uadyCEi+6vLe
         qdbwfKE9xqINhui77ms2mZoNDKdZvyEw6VjpAxEatmxpxo8Y4cv8jWagHks/sikeuCXW
         pqywyg3wp1b+93BK4S0zmFgE1pyGHilspCXGZy3XzidHfqpjBqZn0n80SF5CeCwcw4qx
         0fYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SL4EWbx4NBAGR5Ppiq2v7C/YTDepZ3O+7v26rOrM0n0=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=oOn9qN4hZq3QHpD7rUOQ5Ds9G6nC8VLqsaW1nQJcgOFWI6ke8sVavjTXG7I8uTF/PX
         7VJaFlY5SiO7Bgm7sysAlfTl8sqSgtYnWtk272wZoxWKuOi2XotNfbrdDpIbOTWNkqFm
         S2s8EtBnTgKldu7L6cTUu3/6iK3qoTKUYq0sM03JlL5zf7afsawpkXPWv5Bn1Bv5Gt+r
         JkdWoGB0yjKWvY950btjkkYvd3xYdgOFn13DFUMAAHz4xgNtyt1fHrE+6m9ve6h49SIy
         vNmHVQ/Gx+XhD+zNKsHjRG1Tnphf5lq72bb8EiKa6nXAP8tFxWKy0qh9ECE9oXJrPViy
         9vVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id t13-20020a05620a0b0d00b00789e58ac6absi1719736qkg.717.2024.03.28.09.36.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-mDRbs_lvNnmnqHadzedtVQ-1; Thu, 28 Mar 2024 12:36:35 -0400
X-MC-Unique: mDRbs_lvNnmnqHadzedtVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7874088F2F5
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 75543111E404; Thu, 28 Mar 2024 16:36:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C6FA111F3C6;
	Thu, 28 Mar 2024 16:36:31 +0000 (UTC)
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
Subject: [PATCH 08/26] netfs: Use subreq_counter to allocate subreq debug_index values
Date: Thu, 28 Mar 2024 16:34:00 +0000
Message-ID: <20240328163424.2781320-9-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

