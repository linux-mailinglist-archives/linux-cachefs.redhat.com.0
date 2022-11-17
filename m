Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B928862DCE8
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 14:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668692196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=48SZ9g4sWOdNaFfQ51MhiXSJI5ebQYrImfovCtcp4bs=;
	b=OUMnl5/dFmCYn3CurSahpivwueTvRYefl0ri50uVVAhibsSQOYZ133vxm3Re+wurZZZfDY
	h9STNbUkqjV4TQiJoez9+WXptVMnSoz0u9ZWniXmzNzcujqewY2iU8WDleMnxluZ/YnFwy
	VYWlElI3Sqe7OHyoWBkAr0+xDgr/MSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-DOzhvqnhOT2ng36Ydwu4EQ-1; Thu, 17 Nov 2022 08:36:33 -0500
X-MC-Unique: DOzhvqnhOT2ng36Ydwu4EQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8284382C96E;
	Thu, 17 Nov 2022 13:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF34C39D6A;
	Thu, 17 Nov 2022 13:36:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A90A719465A8;
	Thu, 17 Nov 2022 13:36:32 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7341119465A2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 13:36:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5EF0F2166B46; Thu, 17 Nov 2022 13:36:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 970342166B29;
 Thu, 17 Nov 2022 13:36:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221117115023.1350181-2-dwysocha@redhat.com>
References: <20221117115023.1350181-2-dwysocha@redhat.com>
 <20221117115023.1350181-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Date: Thu, 17 Nov 2022 13:36:27 +0000
Message-ID: <3716091.1668692187@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH 1/1] fscache: Fix oops due to race with
 cookie_lru and use_cookie
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3716090.1668692187.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

You can probably make this easier to trigger by putting a delay in the state
machine if the flag is set:

[fs/fscache/cookie.c]
+#include <linux/delay.h>
...
 static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 {
 	enum fscache_cookie_state state;
 	bool wake = false;

 	_enter("c=%x", cookie->debug_id);

 again:
+	if (test_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags))
+		msleep(100);
 again_locked:
 	state = cookie->state;
 	switch (state) {

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

