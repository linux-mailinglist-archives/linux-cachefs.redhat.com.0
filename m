Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CEB6E249A
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Apr 2023 15:48:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681480137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kKWUqX1LJH61sf3so9GuaLCiSeR236gciS6O0kmpf0k=;
	b=FyMo4KqBdQChE25dkRMhCbR6YtAYMaJXaHHQOFUWNZAioz9sQ/dQNFywqD1mGdl+LWah6e
	EgNRWAMh8WBHq1lnGafxjxaPbUuFf5XWp79s3oa+1I4+eUqZQbc2wIszIrNXagBUeVjM1c
	7wbvT1LHIwKX0VRTGFx/GObfk/HLUls=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-JK7TJL9nM7eKt118N-cGcg-1; Fri, 14 Apr 2023 09:48:54 -0400
X-MC-Unique: JK7TJL9nM7eKt118N-cGcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 430AC889058;
	Fri, 14 Apr 2023 13:48:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6072166B26;
	Fri, 14 Apr 2023 13:48:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C2CFC19472C4;
	Fri, 14 Apr 2023 13:48:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D04C01946A7F for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 14 Apr 2023 13:48:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AFBEE2166B2A; Fri, 14 Apr 2023 13:48:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8577E2166B26;
 Fri, 14 Apr 2023 13:48:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20230329140155.53272-5-zhujia.zj@bytedance.com>
References: <20230329140155.53272-5-zhujia.zj@bytedance.com>
 <20230329140155.53272-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
MIME-Version: 1.0
Date: Fri, 14 Apr 2023 14:48:48 +0100
Message-ID: <1250225.1681480128@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH V5 4/5] cachefiles: narrow the scope of
 triggering EPOLLIN events in ondemand mode
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
Cc: linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1250224.1681480128.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jia Zhu <zhujia.zj@bytedance.com> wrote:

>  	if (cachefiles_in_ondemand_mode(cache)) {
> -		if (!xa_empty(&cache->reqs))
> -			mask |= EPOLLIN;
> +		if (!xa_empty(xa)) {
> +			rcu_read_lock();
> +			xa_for_each_marked(xa, index, req, CACHEFILES_REQ_NEW) {
> +				if (!cachefiles_ondemand_is_reopening_read(req)) {
> +					mask |= EPOLLIN;
> +					break;
> +				}
> +			}
> +			rcu_read_unlock();

You should probably use xas_for_each_marked() instead of xa_for_each_marked()
as the former should perform better.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

