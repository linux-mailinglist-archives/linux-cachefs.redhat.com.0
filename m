Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4024E299E
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 15:05:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647871552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hj39yEzaG+4puSI5Z9U2XGOgic5YTWluy6dsjeY8IBM=;
	b=BW5LUwjy6GNw2JiqiUQhyLcdpAYY7W6tpNbrtzZuJ/xNKpObY3GoSU7Pkn3vIFBdHNXOLA
	AhR/cR/28ZanuPml7NhfSEPWKaTS8NCisSKXomsMwcuRwLNZwXcqdpC59BBXd87Ur73hTn
	4rtMJSdxaddUPSxyehvJKswUeKeqD/U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-rYlWMc94PHKKgjBQI1pebw-1; Mon, 21 Mar 2022 10:05:49 -0400
X-MC-Unique: rYlWMc94PHKKgjBQI1pebw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F8BB1C04B44;
	Mon, 21 Mar 2022 14:05:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F19BC40CF8FA;
	Mon, 21 Mar 2022 14:05:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C6D911947BBE;
	Mon, 21 Mar 2022 14:05:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E990719451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 14:05:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B467F141DC29; Mon, 21 Mar 2022 14:05:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 942011410F35;
 Mon, 21 Mar 2022 14:05:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220316131723.111553-7-jefflexu@linux.alibaba.com>
References: <20220316131723.111553-7-jefflexu@linux.alibaba.com>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 14:05:43 +0000
Message-ID: <1029512.1647871543@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v5 06/22] cachefiles: implement
 on-demand read
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1029511.1647871543.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> +	{ "cread",	cachefiles_ondemand_cread	},

Rather than adding the cread command, would it be better to use an ioctl on
the anon fd as the /dev/cachefiles write op is serialised?

> +	/* Stop enqueuig request when daemon closes anon_fd prematurely. */

"Enqueuing"

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

