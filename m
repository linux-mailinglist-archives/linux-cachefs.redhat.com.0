Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6FMXGWQMGQE5LN4RAI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A051836286
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 12:50:18 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429cc1afb92sf61309241cf.2
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 03:50:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705924217; cv=pass;
        d=google.com; s=arc-20160816;
        b=dgJQaLj79WRsN1AhJhiH4I9UR1ps9dUiCrBA+IdvNV1DIJD25mT/O+bIg0z0B7vFUW
         MC6pItoR/WIZfqSdqsM9j/FC8OnJZ1zA02G8SvE8SALmiybJ3Q8CcKZ2Plsb2zYWVQnW
         EL1UgrNQ0rugDLLKznhZpprsJkKsuzBwk+yW2+d+GZ+eqQ0rcS3yv2bICzx7Gd5ymV8N
         6xQ+Ve92GN9HnxLXSoYteELDwA/6GXJmLRTFN0F0UCuX2NTiVe+AtksNoVVBdhRtBlLy
         +O/sS11yF8Sxy9XDa+6YXIVIDD7b9LT891dtn9Ob5oXPCHabk0bT6ie6vH1CWDDzzOt9
         IaQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=16/oOkE7F1mmQWRgBNtL/pRCojRSpSDI3//YYM5RSbo=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=uf2HtNAtiNiti8KtWZgYTMfD9PupiAY3F3WVRihOlA/HFr+gcPkFD16v6mXX5aKEfT
         bdkqtuIOOIpDOuJTfA51Dch//3D38y+DNRYZwX1QCUNR7IYtQvKnTLesE8Mn0kidD1gL
         cgxFcGllyZg0/MkAiyXx/RqzXPuqJHaKInAEedCJd4ZAbldKiHicgig+25PxktKGquQ7
         hD8ljlXOvsIsO2g6DB8415OieSGJvT+BuRqVFkvl7Um0Q7JosMNfM50cO7brPW+WdOvt
         cE3fvhUT3ZSZw4AN1yui8BV6iZF7Pekg8l05TTjNCCkmdfmdeW4nr/LArSlb9sdC4zDl
         eAEA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924217; x=1706529017;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16/oOkE7F1mmQWRgBNtL/pRCojRSpSDI3//YYM5RSbo=;
        b=NFZzs9z4WDZickKn0GQDJVQQpc/RPAJu88mmMGtIWk5XP72NukyN4FUZT0r1vcA2Th
         gSW3IH8eTXxs46KNe6ADHVVC8JYvKd1Xlc8hC0SSEsldEav45Kc0rAV8fWgACqE4vL/Q
         Z8ve1rS1TkgEmL9/EkK4ggSwRjy/R5nkySAkamEmUFxPyabpWA19LiPB8AbLcRtquZAB
         AziJpW/fFe3SFGSAWXhVdFR3e0TLA4x+NsFJhEqnGT0OchCZZNoHwVS/kuFVEudzinAd
         h0X0VgtSBiqnHUnga6+vFRiR2lFwNAFYbJteBigcsZxwiZ8Nrqsg30QD3TJmSk84n5Aa
         ybeQ==
X-Gm-Message-State: AOJu0Yyyu7vFAsnCd+p6QjBmlrmObnWG0CXM7unfXcQt/xHwShkXkhby
	XR82m5lxHvENbz6D3L0NcQj+tUq3usaVsHDq0wQU5rikCiJi//s1qOPRCX4n4s0=
X-Google-Smtp-Source: AGHT+IHt2CUrV3F/cxoJA2sGSCpcuEYt3njKv2x+U/75Mb19IxHJHk4sbr4viII3CtdbyPhhsRFe1Q==
X-Received: by 2002:ac8:5bd6:0:b0:42a:2fb0:477e with SMTP id b22-20020ac85bd6000000b0042a2fb0477emr6566342qtb.53.1705924216982;
        Mon, 22 Jan 2024 03:50:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5c85:0:b0:42a:4391:1ce9 with SMTP id r5-20020ac85c85000000b0042a43911ce9ls152508qta.2.-pod-prod-06-us;
 Mon, 22 Jan 2024 03:50:16 -0800 (PST)
X-Received: by 2002:a05:620a:bcb:b0:783:458e:2458 with SMTP id s11-20020a05620a0bcb00b00783458e2458mr6099925qki.113.1705924216345;
        Mon, 22 Jan 2024 03:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705924216; cv=none;
        d=google.com; s=arc-20160816;
        b=plFBG4pjIVHub/jwSjAhmTZNUum4dOBLi3KCQVaM64oy+ninugzVXMqg1qPI0xF5ck
         GzsKRIXOcjTgW9fEipBUqZMUx6Qt3R8t3IPJP7PLNyxLHHVDfP0F97iVc0pdPN4IUast
         LxQL44YUXEwUt+aQOmNsrzrCoSZdBGdz6DYEmADP6y6U7t9SS+PIPNm9GUsdPBT3JFtC
         Zlaw28NZTuD/fvkP8xtqBoW2bYogjqCm7KJ6Lcz0D2s/1RfPEWtuc9jHjUZekt3jkigc
         NU9NnWfyUkiuo9cX/iWsPrJktMj8ikUysp3Nx1aIDK1CPOvYsXRmLneBfHho3zX1uqjm
         OkMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=2AeAHAEfe6p91PoKvpPp+65g3eYULuZvdVr2/JzDo7o=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=uD1G9wN6kSJaQLl43+UKDJ507g05pH/nIq4eAa346jKTE/cLW+PtwCAx6kg0Xilz/s
         xve1/NclBHouXiSCAfMqhU0XcVUmH3MnAmxmoRDlFw2GCIF5/zVJ5K1eySqLw2stCfgr
         GRjWFI+LvbDRQMBRBtw2Nap+vOu5kvWepaHy56y5xY3Pe47iWZXvoMK/o2CwFQXRgMrs
         me+Elq893soLXODsD0/X10oyINvxDPDKPaDfLnsAmFgpnn2Nz56RUBUWFi+oB/Er6PSl
         IfGe+VLatwUxXn5CDfuc1lTKGhZCvCw/eF5OoHWs3UIT8dwcT57INs4RLv+X0SSZEpC6
         cIxA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id vr18-20020a05620a55b200b00783222ee668si5197491qkn.567.2024.01.22.03.50.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-EdPo43MVMiCvdOX0BUVt-Q-1; Mon, 22 Jan 2024 06:50:14 -0500
X-MC-Unique: EdPo43MVMiCvdOX0BUVt-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E42185A786
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 11:50:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8EE18200A7B4; Mon, 22 Jan 2024 11:50:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA6FC2026D66;
	Mon, 22 Jan 2024 11:50:12 +0000 (UTC)
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
Subject: [PATCH 1/2] netfs, cachefiles: Change mailing list
Date: Mon, 22 Jan 2024 11:50:00 +0000
Message-ID: <20240122115007.3820330-2-dhowells@redhat.com>
In-Reply-To: <20240122115007.3820330-1-dhowells@redhat.com>
References: <20240122115007.3820330-1-dhowells@redhat.com>
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

The publicly accessible archives for Red Hat mailing lists stop at Oct
2023; messages sent after that time are in internal-only archives.

Change the netfs and cachefiles mailing list to one that has publicly
accessible archives:

	netfs@lists.linux.dev

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: netfs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: v9fs@lists.linux.dev
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: linux-erofs@lists.ozlabs.org
cc: linux-nfs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a69..ab5858d24ffc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4547,7 +4547,7 @@ F:	drivers/net/ieee802154/ca8210.c
 
 CACHEFILES: FS-CACHE BACKEND FOR CACHING ON MOUNTED FILESYSTEMS
 M:	David Howells <dhowells@redhat.com>
-L:	linux-cachefs@redhat.com (moderated for non-subscribers)
+L:	netfs@lists.linux.dev
 S:	Supported
 F:	Documentation/filesystems/caching/cachefiles.rst
 F:	fs/cachefiles/
@@ -8223,7 +8223,7 @@ F:	include/linux/iomap.h
 
 FILESYSTEMS [NETFS LIBRARY]
 M:	David Howells <dhowells@redhat.com>
-L:	linux-cachefs@redhat.com (moderated for non-subscribers)
+L:	netfs@lists.linux.dev
 L:	linux-fsdevel@vger.kernel.org
 S:	Supported
 F:	Documentation/filesystems/caching/

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

