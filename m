Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E856A396
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 15:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657200418;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q/cJMpH78OS0LagNF9EGm21x2MXqaycn/2NXalcaUNQ=;
	b=Aj7EljEJIOIGIEJ1Raih4mA/ow8Dfloq8BKFgbzfQiHIQXYptyiGZebb8vb/9t5I68sBi8
	Gx6axlGkei/amn0VEoDSjevE/9u1h0JdUw33P3XygrfOtZgHdD8ZgqqVu4lqPgERnbgx0N
	QKdKkGrzkW9xQQ52VCqdUoY9lu4JCoY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-YEsHPRYtOvWkiy2YebuFDg-1; Thu, 07 Jul 2022 09:26:49 -0400
X-MC-Unique: YEsHPRYtOvWkiy2YebuFDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 229523C2F764;
	Thu,  7 Jul 2022 13:26:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18AFE2026D64;
	Thu,  7 Jul 2022 13:26:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CB1F4194706C;
	Thu,  7 Jul 2022 13:26:48 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C3891947069 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 13:26:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1EC872166B26; Thu,  7 Jul 2022 13:26:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE8D2166B29
 for <linux-cachefs@redhat.com>; Thu,  7 Jul 2022 13:26:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0472A101A59C
 for <linux-cachefs@redhat.com>; Thu,  7 Jul 2022 13:26:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-9xyuKnWrO6Sj4rBvoW8HdA-1; Thu, 07 Jul 2022 09:26:43 -0400
X-MC-Unique: 9xyuKnWrO6Sj4rBvoW8HdA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o9RWb-002bGB-Mq; Thu, 07 Jul 2022 13:26:33 +0000
Date: Thu, 7 Jul 2022 14:26:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YsbfCcNvjMVcT2yx@casper.infradead.org>
References: <20220707045112.10177-1-xiubli@redhat.com>
 <2520851.1657200105@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2520851.1657200105@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v4] netfs: do not unlock and put the
 folio twice
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
Cc: keescook@chromium.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 william.kucharski@oracle.com, linux-cachefs@redhat.com, vshankar@redhat.com,
 marc.dionne@auristor.com, ceph-devel@vger.kernel.org, idryomov@gmail.com,
 linux-afs@lists.infradead.org, kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 07, 2022 at 02:21:45PM +0100, David Howells wrote:
> -					 struct folio *folio, void **_fsdata);
> +					 struct folio **_folio, void **_fsdata);

The usual convention is that _foo means "Don't touch".  This should
probably be named "foliop" (ie pointer to a thing that would normally
be called folio).

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

