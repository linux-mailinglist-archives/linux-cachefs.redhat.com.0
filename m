Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32398598489
	for <lists+linux-cachefs@lfdr.de>; Thu, 18 Aug 2022 15:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660830375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7xNy1SEKQ7fWopeYfsXGA4oLa74QluoBNEua9wvjgzs=;
	b=PIl7kyBaYlayClVM/34y9xxFJMJsPAocacJVfGapk/E8jIEiKaID5eRC3R/aJNxbnt1Ubj
	yiMu6tb5zbjbeW9K4eqgfbIkINV9LMUtnc0j+CLsiPFrMNma27/6LpAROFUiiT2Zhlkfcv
	8huZi4MQHaALPYJmWPYY+MS6YDPirOY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-itUtR4FBMRiFdqZBnB7Ofg-1; Thu, 18 Aug 2022 09:46:13 -0400
X-MC-Unique: itUtR4FBMRiFdqZBnB7Ofg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4871C293248D;
	Thu, 18 Aug 2022 13:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A172440D282E;
	Thu, 18 Aug 2022 13:46:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6E926194E11C;
	Thu, 18 Aug 2022 13:46:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C0AB1946A41 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 18 Aug 2022 13:46:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27DDA492CA5; Thu, 18 Aug 2022 13:46:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2405F492CA4
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:46:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CA71811E76
 for <linux-cachefs@redhat.com>; Thu, 18 Aug 2022 13:46:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-baqNPUB3O9-BUcrXYLJDXw-1; Thu, 18 Aug 2022 09:46:09 -0400
X-MC-Unique: baqNPUB3O9-BUcrXYLJDXw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FC88616DA;
 Thu, 18 Aug 2022 13:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F2FC43155;
 Thu, 18 Aug 2022 13:39:07 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oOfjl-00AY7t-K0;
 Thu, 18 Aug 2022 15:39:05 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	corbet@lwn.net
Date: Thu, 18 Aug 2022 15:38:57 +0200
Message-Id: <dfd8112d0229154fea7d4c833d3248c3d15c6650.1660829433.git.mchehab@kernel.org>
In-Reply-To: <cover.1660829433.git.mchehab@kernel.org>
References: <cover.1660829433.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 11/13] fscache: fix kernel-doc markup on two
 functions
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
Cc: linux-cachefs@redhat.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The obj parameter was replaced by a cookie. Update docs
accordingly.

It solves those doc build warnings:

./include/linux/fscache.h:270: warning: Function parameter or member 'cookie' not described in 'fscache_use_cookie'
./include/linux/fscache.h:270: warning: Excess function parameter 'object' description in 'fscache_use_cookie'
./include/linux/fscache.h:287: warning: Function parameter or member 'cookie' not described in 'fscache_unuse_cookie'
./include/linux/fscache.h:287: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1660829433.git.mchehab@kernel.org/

 include/linux/fscache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 720874e6ee94..bc089ce2c903 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -258,7 +258,7 @@ struct fscache_cookie *fscache_acquire_cookie(struct fscache_volume *volume,
 
 /**
  * fscache_use_cookie - Request usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie to be attached
  * @will_modify: If cache is expected to be modified locally
  *
  * Request usage of the cookie attached to an object.  The caller should tell
@@ -274,7 +274,7 @@ static inline void fscache_use_cookie(struct fscache_cookie *cookie,
 
 /**
  * fscache_unuse_cookie - Cease usage of cookie attached to an object
- * @object: Object description
+ * @cookie: The cookie to be unused
  * @aux_data: Updated auxiliary data (or NULL)
  * @object_size: Revised size of the object (or NULL)
  *
-- 
2.37.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

