Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJ52S2YAMGQESAOXSVA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id E97258905A5
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:39:04 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6964043b5f1sf15864496d6.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:39:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643944; cv=pass;
        d=google.com; s=arc-20160816;
        b=gvfcL+WJY5SauTj0UUb016BRcf68Df54fIU9E3WJ6+meOFoO4dGwyOz5rBqRUPMOZ7
         Py41BQKoo/zXQScr2caFOMq/cUNpotYcOCmfWpY9fxoxWvJCDwCHFeuwajcKo7vU2E2j
         KCuyO0yx/gDF2hsjujffJUl3OjIC501gmt9RxUg+wKYMBrSrzCTDQPetURXib+0nlwj+
         LgLQPO/WFiSiyTZRvpYWJeYDJhzGcnwedNjyTkAGncudWK85cQfJh7KWuykKtbTz/SHs
         BBLyxevitaQvQ0nZJrK1J4Sd3k+dZKzdHhhgIZzYI+9uyYslDxW2xeIrAMzsh/CLhRFc
         hBsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=zkFrt2CpMj9gCg7Ev41+UonkQqNQaiqIUxp7UM2OEHA=;
        fh=Z1AyDYMlmkzIPYpH15xtLAv4gB8waQQtCyNW7IW/Uw8=;
        b=rDVpE14JQHs593Cua1DHzRW1vbkwDLtc8S/8WKbegtzNtB93T4xUJqVg08KPL5sNHS
         kFNr6iBrmyxSdg8r3EOKr643c67H4+6+ARa5MWrIefA9qyWVTJH5RcLqmBQdV5I1ooT1
         gO4PCPqWt+aZbvLXygIdjX2OeRKkkMoiKXf5HTr5dyJifS247ciKZhlQZH5zr6cO4eG/
         TkOJhN2r8sbGroZ2L2X86ktjsHZ7T0znRRm8FqRMkiPxocXc3Wojqx36B0MC+uT+tn8s
         xSlEHMLrSxEMVqr39YyjWAV+5YDsTlt1tiSu/I/k/SemVGmEjcraYavTPID6chuEnwFB
         2TDw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643944; x=1712248744;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkFrt2CpMj9gCg7Ev41+UonkQqNQaiqIUxp7UM2OEHA=;
        b=BjMYyqTwuXWMTrIPHGT1hlASty2Hqrkb7BmGs1+Ne12kNXSvHvl2GO7N70UcyZREI5
         4j6QuPn/uBsungEWRoID/GxgeKIdgrHIiXZlcfSIvA9iSkctiy+I1Y9vcinYEjteh6HB
         VkA1P3mhXIYjByx7yPWXauP3vZxdGfpc1UetNZxyw5dCqpzNtyT4ujrlp7RnS8tqxUU+
         BCWczAbUTsjBOBUmKBYO2l5FRYgAoAQyq2OAYnu84s/Frl8Mlx3hq1QMDBuDAmlAfRQs
         Xn+ZWvH/mfTU0rDga5Yu5L77ePfo/uCpYPmg/6LAqpH5bMAoiHVjRQUGAzScDCpzx7yS
         07ng==
X-Forwarded-Encrypted: i=2; AJvYcCWZSVbMQ1MyzmLgeZlfeMbRFm8M267TZeL9cmBv9YKOoa05T6MPjOIzyBxzxa5LS+OlGFFIjUaEPj7AHcQp79Sfn/PJmu1vCiv2bwA=
X-Gm-Message-State: AOJu0Yxfo24Y/sU+dJR2bzPe42j47IQE9v9Y/0zD/W9An7V337FI9Rf7
	RPicLC7TvkigWdMzNuis8tr92gDIWItCx5zDo3Ii/Ct17RZH6iutT5/Z5qlKUFk=
X-Google-Smtp-Source: AGHT+IHm5H5+6Kw+PaqSIO5gb4WT7plZrlHDTC62hHS7e4r11xMXkbhApt62ZwaSIiTA+1UtCOXFyA==
X-Received: by 2002:a05:6214:1548:b0:696:8de9:dcd with SMTP id t8-20020a056214154800b006968de90dcdmr3113407qvw.25.1711643943993;
        Thu, 28 Mar 2024 09:39:03 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2606:b0:696:78dc:ab6a with SMTP id
 gu6-20020a056214260600b0069678dcab6als1792831qvb.0.-pod-prod-06-us; Thu, 28
 Mar 2024 09:39:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTeKnbU1GwrdXQRMEc302eHrbRgWpjP9PtOl+tmFcAaWggsse72wYNP9M9bDVBBkiWZ9ftCEiPGDZ7cR7wO/ksIJwAi+DTSWGnq8mytWQ=
X-Received: by 2002:a05:620a:9c7:b0:788:2a9b:1312 with SMTP id y7-20020a05620a09c700b007882a9b1312mr3054436qky.20.1711643943233;
        Thu, 28 Mar 2024 09:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643943; cv=none;
        d=google.com; s=arc-20160816;
        b=lQ1pFDzpkmbh46atGJ2HWuAKCKOWs6a/NvkMG8YajZtO+kX13gfFMeOav4fhXacjy6
         KDjsswRVR2/DUNfkKhP8DYtvKjD4y56piWZdp6Tl73o5rEhqenfAFeVFHD2BDnNapPAc
         WAAm/AF7iei1NwwZNFXcdWFfPAgWZe+hs/NuYXnty8IF8NKowT7DwiIg20x6WnM2Jf6H
         C71RQIV86QceCMsGK3Um/YpREiAXpFOzm8WXR1R9mzZAZXg/y89Q+z7eRmdR2qLsGUG0
         kepM8fqPNVryz/EniuRpKRp+biLzSo09/NPxa/CaG0Zen7qYalY2F5yv4YBttElt09Y9
         0+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=456sspCvb5RC8F6uPLvmqcL+ECbtkHJJvcCgmdRCz9o=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=qC87atPp+fvq3KvjzpvM+cibwfdJaxFClwAiwsZPfO9czBCl3swtrkahrcUvWAllUP
         u1dyKzUfqHzQzHSJ6FtMg7YyXLQFVocdcYjUHpvvnnJxLdKuEwZGnARiMXM6tK/EL+Xp
         N/qZBiIe8Y/SE4iQ2JqLiNlwSo7bRk4fAp1zqc+fupfuQtc0sfzR9fT0/1PLL1KWK026
         LdWCju9tOXBT89Z3hFBG3hILT4KNf3uQJ84JS/TRVada6hlhhjgoX5LLQZf2dmyoizXA
         Qx/xZC2g/5PuDdtTSoALqYBlKMoG2uKRUxJhH2KoMDP+u5YYXAYbFpNq9CKL4o1YKakl
         a1Lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u21-20020a05620a085500b0078a472fab46si1755906qku.622.2024.03.28.09.39.03
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-vRvCaRGQNR68mg1xwDOiNA-1; Thu, 28 Mar 2024 12:39:01 -0400
X-MC-Unique: vRvCaRGQNR68mg1xwDOiNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A0E6101A552
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:39:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 36E5B1C05E1C; Thu, 28 Mar 2024 16:39:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1AEB1C060D0;
	Thu, 28 Mar 2024 16:38:57 +0000 (UTC)
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
Subject: [PATCH 25/26] netfs: Miscellaneous tidy ups
Date: Thu, 28 Mar 2024 16:34:17 +0000
Message-ID: <20240328163424.2781320-26-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Do a couple of miscellaneous tidy ups:

 (1) Add a qualifier into a file banner comment.

 (2) Put the writeback folio traces back into alphabetical order.

 (3) Remove some unused folio traces.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/buffered_write.c    | 2 +-
 include/trace/events/netfs.h | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 2da9905abec9..1eff9413eb1b 100644
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

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

