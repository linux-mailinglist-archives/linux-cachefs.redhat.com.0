Return-Path: <linux-cachefs+bncBDLIXLMFVAERB65MXGWQMGQEHR2OWAQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CFD836287
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 12:50:21 +0100 (CET)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-59884ec9e3dsf2225715eaf.1
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 03:50:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705924219; cv=pass;
        d=google.com; s=arc-20160816;
        b=FB16aib7OHXLDJr803GYRYD9q8ciRnGFshOcdahJ+CnlITqcVOtn3zVkdLUIWjQJ11
         GQ4Lb5X3gLEu9a+2QJhm7KHJOJaD3WgkKRwELLoUNNSUtrJiVeK0DVaeWqegKx+p8bB+
         pVnqDoW9ml5wEbZMxljeCf8k6il+YuIOZiGE6/in00vt9l0zKKP1ftbx74bOo8i9aMQo
         wTY/IBs0p378TC1hPetaT+sTW2cPOqB0JXqC6e8aSE6fpZr0PymixrRH0L23r5xT/qDd
         GV5dkmrMrSeRSvZK/ZbmI9NwDS3WJVv62hOs46JUlmLKiwLQKewXNN707M8EN/w7JBxr
         3mtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=szPe45sePs4Oq1Ydmos5nvtNB3qqnhpt6q0GKif44zU=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=Xmw703/zJ9Qu6olAFUoV7MsY3avj7JHbhufq5+50dQPkyhBWJPdNNxLGi4InHMfNeJ
         2HcblKlN61zeNVBXAp04m3ASGaVEOx3kIReZLVKksB96b1Rs4nKKRtxD/H4SBCyxy1PC
         ejwHntos+dJ7sZrQx0Cmdf3na4WNoasMIWGXOUszpJPETUqiK4/D5oeRh2P+rLRgXW2R
         sNTuIBBQVEWfiXUpd9JswqImxlYsep5lDj8c5nmMfWi9HWaQdi8hgTuooMFHZIRREINC
         siRV/EJe2ol58TzQRjCdRUU15MDw6K6O3NVhepyLO+PZmkgMEc5uFqp7pgExDxotpGKa
         w/dg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924219; x=1706529019;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szPe45sePs4Oq1Ydmos5nvtNB3qqnhpt6q0GKif44zU=;
        b=FfbwhRHYyESZt1sMQ6hZrPGV6CARkncxL8tET30p0W+StLnmnZbu+ENsFsf5O84LgA
         ezFqe4QCHu5vH8xZ///3YofT/ddSi4AR9wXL58FevfqsomcwWYBwNTWT2RZW5+HBHMyg
         5rsyyHrR6duxBoLy2iAm0rII4Ve519ZiZk5sy5Ddwlul2cs7Wj6lJJCZ3rnAoR31mWFK
         TiMslhhoJc+LT01jZ3Sk22IJDODQc8hvzRcWhKfbXYvVmsBuc1RtHDlueKS21w/RtlEh
         2w3lCOv5P8Vp42L1eavgjnngJJei8UhXRNk3KqBskSgUy2tG7yyquvIN9c5pGCZXeWt7
         OhTg==
X-Gm-Message-State: AOJu0YwIDwYOal4me+om3oKumR9uOJGnMLaeH6PlG++UXmTKJaru1N9J
	+vA+eYQvIWP7fta8gcdapvgsMtbJGDh0/vdcx3QwI+MQaX5e/0Dc5EAfcASJBBU=
X-Google-Smtp-Source: AGHT+IGqH5YMIQ28Vy3HQuQuha6vLp4Ae/4y3FJSCZISMVcQzoXNhFGypc/IMs/xNNNJ7GsIoyInwA==
X-Received: by 2002:a4a:a5c7:0:b0:599:49a8:763e with SMTP id k7-20020a4aa5c7000000b0059949a8763emr2224726oom.6.1705924219685;
        Mon, 22 Jan 2024 03:50:19 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:902:0:b0:599:1da6:a4d8 with SMTP id 2-20020a4a0902000000b005991da6a4d8ls2047337ooa.1.-pod-prod-03-us;
 Mon, 22 Jan 2024 03:50:19 -0800 (PST)
X-Received: by 2002:a05:6808:3c85:b0:3bb:cdc1:425d with SMTP id gs5-20020a0568083c8500b003bbcdc1425dmr4674617oib.115.1705924219105;
        Mon, 22 Jan 2024 03:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705924219; cv=none;
        d=google.com; s=arc-20160816;
        b=oXRBITK+VBlVP67TDXOR9acH5QupTlWIL9Bn74s2mWjZhJwZbIcMfK4X66AJ61cdlM
         p6Va5quUlgmR9mQM1prFCWaY9h1+5HSeImeOjUZBDg4lpzAboRLvO1qwr03MFyi/MiTz
         WF+kgocCCEj/JIJrFRg8t65IZAXhkwksRrPXFWrsc9kJjN7rHt2vK3xgnnk60YxkQ3Bn
         0l8wC31W9sJYcCPgMBdWevdFOXIBxRP5M9udmy7j2hHKYUo98PFI1ru41q4cHGIc/yHH
         npus2SjRFZf9JSctxuO6UsjWVlGBHyB6SyiwUlIb17KvsvtaOHCXnCYxZiCdzaGKj0WC
         UCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=KeeG0FfVujDf91nAvy13CDWA92gJt33lwcR42KZA7GE=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=HvKeyyJS02yXa0rsrntpjjypkloRTXj4eXi9HW4dELkJ1Qn7nGrsJDMd2B5WtQN2+A
         3zyczNd4NmYUJ9WGZOHfUYem3p8qizoRcEbkOznSZkFhYllebfSZFHaUYx8xxj9qVQbG
         1OTD7pdsKbllLSwgk8lnKlxs2Fnvw+BTvfBIvID5ME74js3y8xoKCtMKnsm/BsyXjANF
         /Xs7/9p1S02uC8irksSaig9KyqQOfu5NeFmUT9MzzMs16R6NxVVlK7ba+nefmW5tGCYD
         ph3lzGaVnLUITpO2a1LwKdza/0h0dXYFY2ZrhzTIziG0gLyiOTAfTNVJcNia4Rw8d4rz
         5h8w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id w19-20020a05620a445300b00783a44b9663si523388qkp.206.2024.01.22.03.50.18
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-vmATBj2QPImacT5_44JqQg-1; Mon, 22 Jan 2024 06:50:17 -0500
X-MC-Unique: vmATBj2QPImacT5_44JqQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56F6C185A784
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 11:50:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5306540C1430; Mon, 22 Jan 2024 11:50:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5369D400D7AB;
	Mon, 22 Jan 2024 11:50:15 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netfs@lists.linux.dev
Cc: David Howells <dhowells@redhat.com>,
	Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] netfs: Add Jeff Layton as reviewer
Date: Mon, 22 Jan 2024 11:50:01 +0000
Message-ID: <20240122115007.3820330-3-dhowells@redhat.com>
In-Reply-To: <20240122115007.3820330-1-dhowells@redhat.com>
References: <20240122115007.3820330-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Add Jeff Layton as a reviewer in the MAINTAINERS file.

Signed-off-by: David Howells <dhowells@redhat.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab5858d24ffc..2f4f4bf2e7f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8223,6 +8223,7 @@ F:	include/linux/iomap.h
 
 FILESYSTEMS [NETFS LIBRARY]
 M:	David Howells <dhowells@redhat.com>
+R:	Jeff Layton <jlayton@kernel.org>
 L:	netfs@lists.linux.dev
 L:	linux-fsdevel@vger.kernel.org
 S:	Supported

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

