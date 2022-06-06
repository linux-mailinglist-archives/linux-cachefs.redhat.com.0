Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8954215A
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Jun 2022 07:51:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-4NQrac-2M7m8WfXyN3vixA-1; Wed, 08 Jun 2022 01:51:52 -0400
X-MC-Unique: 4NQrac-2M7m8WfXyN3vixA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 631481C04B4C;
	Wed,  8 Jun 2022 05:51:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CF4140EC002;
	Wed,  8 Jun 2022 05:51:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 215471947B96;
	Wed,  8 Jun 2022 05:51:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 989E31947079 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 15:33:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 89126C23DC9; Mon,  6 Jun 2022 15:33:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84A7CC15E72
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 15:33:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA6DD1C08969
 for <linux-cachefs@redhat.com>; Mon,  6 Jun 2022 15:33:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-aWNrwk8uNVaWSJXeVurJ3w-1; Mon, 06 Jun 2022 11:33:38 -0400
X-MC-Unique: aWNrwk8uNVaWSJXeVurJ3w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B421E6153C;
 Mon,  6 Jun 2022 15:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27B1C36B03;
 Mon,  6 Jun 2022 15:25:48 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1nyEby-0012PC-6I;
 Mon, 06 Jun 2022 16:25:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Mon,  6 Jun 2022 16:25:30 +0100
Message-Id: <e76a5b3977cb566ecd6d1a8fd55f6c7c1cbafb72.1654529011.git.mchehab@kernel.org>
In-Reply-To: <cover.1654529011.git.mchehab@kernel.org>
References: <cover.1654529011.git.mchehab@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Wed, 08 Jun 2022 05:51:48 +0000
Subject: [Linux-cachefs] [PATCH 08/23] docs: filesystems: update
 netfs-api.rst reference
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-cachefs@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changeset efc930fa1d84 ("docs: filesystems: caching/netfs-api.txt: convert it to ReST")
renamed: Documentation/filesystems/caching/netfs-api.txt
to: Documentation/filesystems/caching/netfs-api.rst.

Update its cross-reference accordingly.

Fixes: efc930fa1d84 ("docs: filesystems: caching/netfs-api.txt: convert it to ReST")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1654529011.git.mchehab@kernel.org/

 include/linux/fscache.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 72585c9729a2..2f82ea31d4c1 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -378,7 +378,7 @@ void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data,
  *
  * Request that the size of an object be changed.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
-- 
2.36.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

