Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAPUYOYQMGQE4WSEEOQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94D8B77FC
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:42 +0200 (CEST)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6a0e1d67928sf8622586d6.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485762; cv=pass;
        d=google.com; s=arc-20160816;
        b=uFZKIQ7opY7hiV4QVeFatg1UycLxEoNFF3cdlYzv7ZeShSff/KJCKSqHBNXY8kGVHq
         Cu3CXBKzIbi/N5Aas81ZBstDzQL8vOAZ6oU/54nq+nEg/XG/L/L/YY/l+LdnCqdh3Lqv
         lRdohoDP5J2enAJIaJcMVXmzVjxdtOcBvCo9tebJaBiatsAHHmzT0+vXRCKVe2UOYMLP
         1L+rz2VwFMKbX+PrUThlVZraGIxx++6dFh9TrLNLRgViwzOyt4/SoQAG/rzM2lfFYplu
         gcpYo3avsRe4qpU1pOXciZHdUoUSiSWU4kSAOetlmSjcL5M6qF2LX96FKUDp3WTw8GPo
         SooQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=CPJCg7m1ZPiVrSI0YQBQkgkTvVZLFu15qmIUB7fsX+E=;
        fh=JQUvkfJmsEH952WMBG+Y1JFZGCuGrNoA6OmwsrlE94k=;
        b=haco6q3nBlPjQ8DJ0WEoa0yUQeNIeM+Hqu39ZVn8v9NWWMC8+R5jaEuEQaKkw+RURT
         WA1dD/P6dAr1dGBb4jhXtgDK6DhrUkW5Jt9wIV1o8xI0oxbDVv+VsLdgoGkIdC/GwYHg
         AXeRkC2zZFlfrDyqhwcTnpfRhlq0Kd/oOjPCmHWrVFH/HvrKVLxp7pdPLCk9TqslUMGS
         5xUQ8jBG9xGWqNIb9aPBqH4af68/gbjYqPs8j4QXtxMTl0tEDLAeZDNwQlSWv9dvDFYo
         Y6vxWxi5477NnJwaAZtVqi9GovbTM/WP91L2DaHO48p8Ek9WZNBdEuFPvaFXNfRLpJKD
         FkDw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485761; x=1715090561;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPJCg7m1ZPiVrSI0YQBQkgkTvVZLFu15qmIUB7fsX+E=;
        b=GaGdxct8d8MKBpN95dK8uf0Xtpd+PAGNd5TlkbyFVO/ZjFK81YWDAOlikGyn9X3QPY
         7Vhs3FKJ+gT/0hg93RJE+K1G2oaM2SpQacgVDZCTbvvFJRHOJtjKhNy/Xx2mSPpamPhm
         aNKpTJR3Vj9EUxLcIEgU8f6dKJLPMsfw8qTd/S7eYchQixLZmgeaMu1r3KpVsPklbhpH
         3nXkVKyjXw1a53rfR1XVHvzM817L0d9CMO4zC/ZJFm1CfXUJz7l69Infgfn7E3QNnCGX
         4zw25cS3DOKqfBSWyUyZk5bQEqDmI8kPejZCxOHZoIK5OepP2rjhVOie/rddpGDfHllR
         iPKQ==
X-Forwarded-Encrypted: i=2; AJvYcCV7ti82QycvNRx347m696GyqY0yCc0+3zS8hqHG61RJHE9yaJiziE8C/t+TBkmouPb1Ya6f0Oa+n2Tq808+KkrGbzGn+6R/VUfToLQ=
X-Gm-Message-State: AOJu0YxIRU/eXM5QODCHk3ykofeG0dH1hFk++wxa72R3YTBpzemvmTtU
	pG9FPsm/ydH2rHRWQHBOPOrJXJbZdlCzx11JyfH5N9PF60VUKJRmp9y1/RFZOtM=
X-Google-Smtp-Source: AGHT+IHpAD9ufrfAgIvzL2gfW2rGtEK8Rt1BM01dpJsyOTHoHOZgxAOZg+CtHep+eOdV6Mm6BN45TA==
X-Received: by 2002:a05:6214:2249:b0:6a0:cd3e:aeb3 with SMTP id c9-20020a056214224900b006a0cd3eaeb3mr7682749qvc.32.1714485761546;
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4ee1:0:b0:698:ed81:bc0e with SMTP id 6a1803df08f44-6a09c61c343ls17406676d6.1.-pod-prod-06-us;
 Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+zes4VRudc5kzvWQFQ9zFWoGEwo6VEA5toXEAs0ihmElpMUzxYRiLh23pz6ZWQBM4ECF3tkWP/JvNix8wejPaHXlXZbv88KswTIVnKZI=
X-Received: by 2002:a05:620a:2194:b0:790:f4f2:4748 with SMTP id g20-20020a05620a219400b00790f4f24748mr5695911qka.20.1714485760849;
        Tue, 30 Apr 2024 07:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485760; cv=none;
        d=google.com; s=arc-20160816;
        b=fGsRywT1yGTNdkxdOPoIGlkN9DPGdic2jugbZkkN8UO8Is4OofIbTTqqR2G4LOQ1pR
         SsfxjguLbbB+KLzUBBMT2ttAOtIgKVQ0vincVXUwxmrlh7KHrijXHTh7/Gj4o6TRhxk8
         2bRl9QKZDw6GyMn5PO2lQ+Rw+/pSF2mBpgAcsaoOo5RLr9J9yxmgPWwfOVXFhdO+t/l8
         URaFIhsfW1emVGq/K6oOuoyRHscdXtiWAKNuaoqLWaM944DAm1iLmWoGQz0j95MjCxBt
         WQaHGLw83OdzzIfs1KaKu5CuIbIARQxKxEfIuTU4uzLf7bONj0OrOgx05XaAfOPaJ71E
         xgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=91B27U8z7Iln6XJD9uh+fX/pmahLPw16tVNP6LRoyow=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=RRADV2VivW8l8pcv4s8x9zaejIUhWq47cIDmgDVZorl2ky8ERssUtOaQLgC2LNEW5z
         Qq3vjpHbGzFhczeV22Tl/jR1+hEiU/ZPBmAuhCTw3YBC89VKDYC1i4rP7bBoEh3Nz6xt
         YqWLxi3X0W+FKRGiNxNYkq3KFIoA0HUsUw+6idT/E5hW00ARiG8J3Eyr6Vl297/uO8Kl
         WZ636085bt0j+CzVeVx7wj7uQq9CIGo+zkmEUIgWNm101knI/+wCjFVkENxAeXYRbRnp
         YUlbOZLlPASDe4iwk3APkvVupF8XB7L3KR4/Rqe7SZ7mENGUTMXs9XMO3kvFtHaffPAv
         JDbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p2-20020ae9f302000000b00790efb07778si5327705qkg.516.2024.04.30.07.02.40
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-Ei1ojTFrPS2O4X8zXZJ2Yw-1; Tue, 30 Apr 2024 10:02:37 -0400
X-MC-Unique: Ei1ojTFrPS2O4X8zXZJ2Yw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA50F81F44E
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:02:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D72221C06700; Tue, 30 Apr 2024 14:02:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7904D1C0F133;
	Tue, 30 Apr 2024 14:02:33 +0000 (UTC)
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
Subject: [PATCH v2 21/22] netfs: Miscellaneous tidy ups
Date: Tue, 30 Apr 2024 15:00:52 +0100
Message-ID: <20240430140056.261997-22-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Do a couple of miscellaneous tidy ups:

 (1) Add a qualifier into a file banner comment.

 (2) Put the writeback folio traces back into alphabetical order.

 (3) Remove some unused folio traces.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_write.c    | 2 +-
 include/trace/events/netfs.h | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 43d2cbcbe75c..d435f39547ef 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Network filesystem high-level write support.
+/* Network filesystem high-level buffered write support.
  *
  * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index e7700172ae7e..4ba553a6d71b 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -141,12 +141,9 @@
 	EM(netfs_folio_trace_cancel_copy,	"cancel-copy")	\
 	EM(netfs_folio_trace_clear,		"clear")	\
 	EM(netfs_folio_trace_clear_cc,		"clear-cc")	\
-	EM(netfs_folio_trace_clear_s,		"clear-s")	\
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
-	EM(netfs_folio_trace_copy,		"copy")		\
-	EM(netfs_folio_trace_copy_plus,		"copy+")	\
+	EM(netfs_folio_trace_clear_s,		"clear-s")	\
 	EM(netfs_folio_trace_copy_to_cache,	"mark-copy")	\
-	EM(netfs_folio_trace_end_copy,		"end-copy")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
 	EM(netfs_folio_trace_kill_cc,		"kill-cc")	\
@@ -156,7 +153,6 @@
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
 	EM(netfs_folio_trace_not_under_wback,	"!wback")	\
 	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\
-	EM(netfs_folio_trace_redirty,		"redirty")	\
 	EM(netfs_folio_trace_redirtied,		"redirtied")	\
 	EM(netfs_folio_trace_store,		"store")	\
 	EM(netfs_folio_trace_store_copy,	"store-copy")	\

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

