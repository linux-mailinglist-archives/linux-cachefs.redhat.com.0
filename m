Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 456834E2A3D
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 15:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647872052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pHkF9MyM+Pf8g6ImfvEoZLMAFEshFg7zuLLY1lOXRgM=;
	b=LZvrzC/4M6x0z0/8saIMCy9m8mFY3dIuTgLoaqSNOcq251wDmEQFx1hwFT/mkgE7gjyQxN
	BG5I7uxBiOadzr2bIlUfTgnHCdkdgx05rCCnKBkorX7HclZ5IXSuohEIlHIdY2tQ8xN7/A
	ie5QW02ybGStH2rAt6Bxla/6uiOKgVM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-Trf6jDdSPgu7syNQ_XoZEQ-1; Mon, 21 Mar 2022 10:14:09 -0400
X-MC-Unique: Trf6jDdSPgu7syNQ_XoZEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81C1B3C00111;
	Mon, 21 Mar 2022 14:14:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B751140EBD5;
	Mon, 21 Mar 2022 14:14:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CD0461947BBE;
	Mon, 21 Mar 2022 14:14:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D7E119451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 14:14:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 41B15429531; Mon, 21 Mar 2022 14:14:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B96CD426353;
 Mon, 21 Mar 2022 14:14:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YjiAVezd5B9auhcP@casper.infradead.org>
References: <YjiAVezd5B9auhcP@casper.infradead.org>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 14:14:03 +0000
Message-ID: <1029982.1647872043@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1029981.1647872043.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> Why do you have a separate rwlock when the xarray already has its own
> spinlock?  This is usually a really bad idea.

Jeffle wants to hold a lock across the CACHEFILES_DEAD check and the xarray
access.

However, he tells xarray to do a GFP_KERNEL alloc whilst holding the rwlock:-/

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

