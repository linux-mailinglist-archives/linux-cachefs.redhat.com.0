Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17453357F
	for <lists+linux-cachefs@lfdr.de>; Wed, 25 May 2022 04:52:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-CKvuu6BEOI2gnUZhUV3wkw-1; Tue, 24 May 2022 22:52:45 -0400
X-MC-Unique: CKvuu6BEOI2gnUZhUV3wkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D50D11E7DCCC;
	Wed, 25 May 2022 02:52:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB9241415100;
	Wed, 25 May 2022 02:52:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E6C81932123;
	Wed, 25 May 2022 02:52:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C54A719466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 25 May 2022 02:52:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B27A71415101; Wed, 25 May 2022 02:52:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8D31415100
 for <linux-cachefs@redhat.com>; Wed, 25 May 2022 02:52:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 971B780159B
 for <linux-cachefs@redhat.com>; Wed, 25 May 2022 02:52:43 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-WrOSKOyUM--zK0uk67xB0A-1; Tue, 24 May 2022 22:52:39 -0400
X-MC-Unique: WrOSKOyUM--zK0uk67xB0A-1
Received: by mail-pg1-f171.google.com with SMTP id h186so17801254pgc.3;
 Tue, 24 May 2022 19:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=s+X9BdhgymZkGEs6XYAhxZ8YaW7Mc7cLeWf6UbB+AxA=;
 b=tny0gr7+/gybFC4MNKDoSOB5q4ok7qANAXdipZ2N6N4KLAI2Zpx/jJ5rh0L6ccplhh
 i6MsfgDMrK93zSMQk2dDnfq6qxvltGRbTXmhrfSERvIq+Qr8pBkV5ZYu/cT7WkLlGx2Y
 Alb2m8Am/PixxWj9riqN2bLw48IUmqMd3Vwfr70uHTGqdi5u9ge6bzpKFBv3apzmKrlz
 IpEFIasJKImlUCfoAAFCYowEg6Mg2nwechKSt/u1mAC7HfsIbB5KR7mMpgLBMOVaQ9eJ
 5fr159ztsgM/MXTsY2lK95XwJeFhLJxCK/Tb+anduRtcZwNV3Zt8eG1uwqSbOq/nDeFb
 zxJQ==
X-Gm-Message-State: AOAM533VVYn45l8F+r9aNgSCYCPHUEjNgqE0npr30gbe2X3KU06FjMUR
 78t9HLt1pcMefF9UTnR8Wxot9HMpmkwbiA==
X-Google-Smtp-Source: ABdhPJylQwGVURZ5dFikU/QeR3oidQ8iU8T2RFJZ/zM89hqiKSc7wCyy+HaBTMct4RfleUW5FUSSQA==
X-Received: by 2002:a63:9044:0:b0:3fa:27bf:448c with SMTP id
 a65-20020a639044000000b003fa27bf448cmr13399959pge.131.1653447158046; 
 Tue, 24 May 2022 19:52:38 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm9897374pfe.218.2022.05.24.19.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 19:52:37 -0700 (PDT)
From: Yue Hu <zbestahu@gmail.com>
X-Google-Original-From: Yue Hu <huyue2@coolpad.com>
To: dhowells@redhat.com,
	linux-cachefs@redhat.com
Date: Wed, 25 May 2022 10:51:50 +0800
Message-Id: <20220525025150.466-1-huyue2@coolpad.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH] fscache: Introduce
 fscache_cookie_is_dropped()
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: huyue2@coolpad.com, linux-kernel@vger.kernel.org, zhangwen@coolpad.com
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

FSCACHE_COOKIE_STATE_DROPPED will be read more than once, so let's add a
helper to avoid code duplication.

Signed-off-by: Yue Hu <huyue2@coolpad.com>
---
 fs/fscache/cookie.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 9d3cf0111709..575a5ba07c0d 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -372,17 +372,22 @@ static struct fscache_cookie *fscache_alloc_cookie(
 	return NULL;
 }
 
+static inline bool fscache_cookie_is_dropped(struct fscache_cookie *cookie)
+{
+	return READ_ONCE(cookie->state) == FSCACHE_COOKIE_STATE_DROPPED;
+}
+
 static void fscache_wait_on_collision(struct fscache_cookie *candidate,
 				      struct fscache_cookie *wait_for)
 {
 	enum fscache_cookie_state *statep = &wait_for->state;
 
-	wait_var_event_timeout(statep, READ_ONCE(*statep) == FSCACHE_COOKIE_STATE_DROPPED,
+	wait_var_event_timeout(statep, fscache_cookie_is_dropped(wait_for),
 			       20 * HZ);
-	if (READ_ONCE(*statep) != FSCACHE_COOKIE_STATE_DROPPED) {
+	if (!fscache_cookie_is_dropped(wait_for)) {
 		pr_notice("Potential collision c=%08x old: c=%08x",
 			  candidate->debug_id, wait_for->debug_id);
-		wait_var_event(statep, READ_ONCE(*statep) == FSCACHE_COOKIE_STATE_DROPPED);
+		wait_var_event(statep, fscache_cookie_is_dropped(wait_for));
 	}
 }
 
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

