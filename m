Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E14EBEC3
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Mar 2022 12:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648636134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mbyeT8wLYGgMzWlnqW7lxh9RAZ0EC8S1GewIua5bVVA=;
	b=YmwApYSXH3iMeHUBfs+NCImynGgiAqnbCL2WKmVGzItIZ8Jk7TToP/FqSchf6H7ICWKJ/D
	Ah8UkJTKfKuAcypAGICt9EXBQaqJVgj8XkFAAr+pZ9wReCQTa+4aGemC8huzTey47tHsNR
	4THhAs5Za9zaYoPjBREvzgTpXGKSE6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-xdmEmXczN4S4B3Ijq_6iDA-1; Wed, 30 Mar 2022 06:28:48 -0400
X-MC-Unique: xdmEmXczN4S4B3Ijq_6iDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8312C80159B;
	Wed, 30 Mar 2022 10:28:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36A097ADF;
	Wed, 30 Mar 2022 10:28:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6CF701947BBC;
	Wed, 30 Mar 2022 10:28:06 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 98F8519466DF for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 30 Mar 2022 10:28:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F06A5C15D7B; Wed, 30 Mar 2022 10:28:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77757C202C6;
 Wed, 30 Mar 2022 10:28:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
References: <CAAmbk-egCMVm0s8P8y455HF7cWyReC0cjnQEkDuLFeoEqhTRVw@mail.gmail.com>
To: Chris Chilvers <chilversc@gmail.com>
MIME-Version: 1.0
Date: Wed, 30 Mar 2022 11:28:00 +0100
Message-ID: <2923709.1648636080@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [BUG] write but no read when using sync mount
 option
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
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2923708.1648636080.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Chris Chilvers <chilversc@gmail.com> wrote:

> While trying the new FS-Cache implementation using the 5.17-rc5 kernel on
> Ubuntu 21.10 I ran into an issue where it appears that FS-Cache was not being
> used when the sync mount option is enabled.

What filesystem?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

