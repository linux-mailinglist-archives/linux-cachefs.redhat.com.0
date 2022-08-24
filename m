Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7899159F749
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 12:19:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661336369;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+fh7hq2uUOnTFabS57oJDbtWNBrKs2SGR2Vo2dtCJyM=;
	b=ZN1z90GERBs1Gxwfun20JrOWlH2Yae6dxFM//CcT15RhH7Ynq2Ka4re2lXRrQj3ON+yvgO
	jnEUk7N104dRvdSs6CDK+TgauBDonh7BvFjArjZ/itnNByt+dGKmOxEQYSfeETmAClik3N
	ki5HEOcDf4icWOJfD0wYEGJoCWCvdhs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-3P4mkp0MNHGKAusLNQba6g-1; Wed, 24 Aug 2022 06:19:26 -0400
X-MC-Unique: 3P4mkp0MNHGKAusLNQba6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1465101A5B3;
	Wed, 24 Aug 2022 10:19:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FA559459C;
	Wed, 24 Aug 2022 10:19:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 751481946A52;
	Wed, 24 Aug 2022 10:19:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01ADB1946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 10:19:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E8D15945DD; Wed, 24 Aug 2022 10:19:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2D8418ECC;
 Wed, 24 Aug 2022 10:19:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220818125038.2247720-1-sunke32@huawei.com>
References: <20220818125038.2247720-1-sunke32@huawei.com>
To: Sun Ke <sunke32@huawei.com>
MIME-Version: 1.0
Date: Wed, 24 Aug 2022 11:19:23 +0100
Message-ID: <3700079.1661336363@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3700078.1661336363.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

	/* fail OPEN request if copen format is invalid */
	ret = kstrtol(psize, 0, &size);
	if (ret) {
		req->error = ret;
		goto out;
	}

	/* fail OPEN request if daemon reports an error */
	if (size < 0) {
		if (!IS_ERR_VALUE(size))
			ret = size = -EINVAL;
		req->error = size;
		goto out;
	}

Should ret get set to the error in size?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

