Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BE59F79A
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 12:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661336744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZqcSdpGpDKQRNm3HDBGYl8kr++Zw5cTXOvrke8FC2rE=;
	b=i5xzSJ+aIYhE6K/Q04KI9pMwgFd72J3WcafJsRMglYcF3rEwqbqt2/+1T6DGDni2ldgTDG
	QaKPsUUXKAeQSun5a6PCbeC3/8KMWeq9kAM2Pjvzp5ift3F3MDA/lGICxFP8+jXV0yyWIi
	Y+j6enAdVABBgAEag7fVMFmL/E2Mi58=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-sCkqgfhFMyWv_HfcxkmktQ-1; Wed, 24 Aug 2022 06:25:41 -0400
X-MC-Unique: sCkqgfhFMyWv_HfcxkmktQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 914BA101E989;
	Wed, 24 Aug 2022 10:25:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8867E492C3B;
	Wed, 24 Aug 2022 10:25:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 69B081946A52;
	Wed, 24 Aug 2022 10:25:40 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E9A61946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 10:25:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 350F21415125; Wed, 24 Aug 2022 10:25:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4591E1410DD7;
 Wed, 24 Aug 2022 10:25:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220817065200.11543-1-yinxin.x@bytedance.com>
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
To: Xin Yin <yinxin.x@bytedance.com>
MIME-Version: 1.0
Date: Wed, 24 Aug 2022 11:25:36 +0100
Message-ID: <3713582.1661336736@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: make on-demand request
 distribution fairer
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
Cc: zhujia.zj@bytedance.com, Yongqing Li <liyongqing@bytedance.com>,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3713581.1661336736.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xin Yin <yinxin.x@bytedance.com> wrote:

> Reported-by: Yongqing Li <liyongqing@bytedance.com>
> Signed-off-by: Xin Yin <yinxin.x@bytedance.com>

Can you give me a Fixes: line please?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

