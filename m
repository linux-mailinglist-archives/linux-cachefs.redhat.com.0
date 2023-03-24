Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D776D12EE
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Mar 2023 01:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680218417;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNMMuoammcAQ/Yp7j3J63f9mZtj4iNYp+3u0vcxYadY=;
	b=Ac9USRbpv3OHN/3vTgs0f+GxManxTpIO4nCA2iO4HWc0A+WhQyg4GPMKLu/uWy65gm7reA
	Mx3AK8mXTTlBdXdWX5NNgMTtZ5SCa5kCroFPlN11724S1ZHbsek9azsXBRWkVsYjR2tZq8
	lXlsY2qNsIEM/acEloZ4XDBxuRYcEuk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-WrI05jZPMIOEEFlsvIlzzw-1; Thu, 30 Mar 2023 19:20:14 -0400
X-MC-Unique: WrI05jZPMIOEEFlsvIlzzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1945C101A531;
	Thu, 30 Mar 2023 23:20:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2256492B00;
	Thu, 30 Mar 2023 23:20:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 64BF219465A4;
	Thu, 30 Mar 2023 23:20:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0A0141946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 10:27:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF02F40B3EDA; Fri, 24 Mar 2023 10:27:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E779240B3ED7
 for <linux-cachefs@redhat.com>; Fri, 24 Mar 2023 10:27:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C90A33801F4E
 for <linux-cachefs@redhat.com>; Fri, 24 Mar 2023 10:27:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-UZ_FmgAvMKmAAAm313lrSA-1; Fri, 24 Mar 2023 06:27:33 -0400
X-MC-Unique: UZ_FmgAvMKmAAAm313lrSA-1
Received: by mail-lj1-f177.google.com with SMTP id h9so1210739ljq.2
 for <linux-cachefs@redhat.com>; Fri, 24 Mar 2023 03:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679653651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KuhONKs+5RXYrZrVNmBNERZljzctIJQ0oXZhOnvnrwk=;
 b=UPB4fPrLQI91VHeUQULoFDK3jmsJ5LX1dlnXBHJ9Jv1loNmb1C0oQN6iW8AFUkR5TY
 rUk7zcpnyjJSqojhz2fh6vPXXDNlnkoGSw0PqClNUFpJG1G+up7jdBlaO0S2MGjUanrg
 RkuWtoO3uxslFL1AzCptyPrz+qQN/ZFoEeoMjHZymwgQcPaArUOJmKUykPMMyytxGePg
 1FbHABHSR6Kqmg1AyXLlcsYek6YEFB38phFUcZOv7H+zrwfSkNtIxe5QumzvaAy9UejN
 lFKPcJbvgtRrr/Vh4ZxDrPGtLWrNlB00VCc4vBpeK/aQ/IJ6w4E7yLDv4+ABSUcFnvdc
 Q4xA==
X-Gm-Message-State: AAQBX9el2CUpm1ITFIzhPlyolpM5rcAObZnfO66/b/bH//pgAkreJe+n
 MgF6pyo7MWQBKNqgIOHIF0fLf3xF8GYSfqf+D+U=
X-Google-Smtp-Source: AKy350a7EXKlHtCBsq4WyQ256V3cCgzCUUeEEiJC5MxO+Jmrs4nWLR5HpiBmGCLD4bkaNVy72lxuXg==
X-Received: by 2002:a2e:8016:0:b0:29b:3a19:bd71 with SMTP id
 j22-20020a2e8016000000b0029b3a19bd71mr780233ljg.35.1679653651538; 
 Fri, 24 Mar 2023 03:27:31 -0700 (PDT)
Received: from fedora.. ([85.235.12.219]) by smtp.gmail.com with ESMTPSA id
 s18-20020a2e9c12000000b00295765966d9sm3353449lji.86.2023.03.24.03.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 03:27:31 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Steve French <sfrench@samba.org>
Date: Fri, 24 Mar 2023 11:27:28 +0100
Message-Id: <20230324102728.712018-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 30 Mar 2023 23:20:04 +0000
Subject: [Linux-cachefs] [PATCH] netfs: Pass a pointer to virt_to_page()
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
Cc: linux-fsdevel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-cachefs@redhat.com, Jeff Layton <jlayton@kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/netfs/iterator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index e9a45dea748a..a506c701241e 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -240,7 +240,7 @@ static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			sg_set_page(sg, page, len, off);
 			sgtable->nents++;
-- 
2.34.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

