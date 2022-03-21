Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 594754E2C4B
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 16:31:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647876660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7iRM9RU3E5XqU/siG6EYnCVd1PTmN2/VS6hJv9M9BRk=;
	b=OdHAP1z0wXvmoq4rN/gFRRjwhP6T8al07Rnw/KTpCDeX4K80Dr/PjrvJ0BeE9b7eRgd+bR
	oGGFAYMFoeAiEh+Sf9+USaFAb8hCOWrkH9Xh17nFs7Wri8OqwWC0Bw0U4w8A0yw3W8KutW
	1OEdPBiHDdvjsekPevMqAmpXPvkwB6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-_OBPD8TYODu5qAmwyNHp-Q-1; Mon, 21 Mar 2022 11:30:57 -0400
X-MC-Unique: _OBPD8TYODu5qAmwyNHp-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AE3E85A5BE;
	Mon, 21 Mar 2022 15:30:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD7540CF8FA;
	Mon, 21 Mar 2022 15:30:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DAF641947BBF;
	Mon, 21 Mar 2022 15:30:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8DF8319451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 15:30:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41842400E11D; Mon, 21 Mar 2022 15:30:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27A1A40C1241;
 Mon, 21 Mar 2022 15:30:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YjiX5oXYkmN6WrA3@casper.infradead.org>
References: <YjiX5oXYkmN6WrA3@casper.infradead.org>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <YjiAVezd5B9auhcP@casper.infradead.org>
 <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
 <YjiLACenpRV4XTcs@casper.infradead.org>
 <adb957da-8909-06d8-1b2c-b8a293b37930@linux.alibaba.com>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 15:30:52 +0000
Message-ID: <1035025.1647876652@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v5 03/22] cachefiles: introduce
 on-demand read mode
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
Cc: joseph.qi@linux.alibaba.com, torvalds@linux-foundation.org, chao@kernel.org,
 tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 luodaowen.backend@bytedance.com, xiang@kernel.org, gerry@linux.alibaba.com,
 linux-erofs@lists.ozlabs.org, eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1035024.1647876652.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Absolutely; just use xa_lock() to protect both setting & testing the
> flag.

How should Jeffle deal with xarray dropping the lock internally in order to do
an allocation and then taking it again (actually in patch 5)?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

