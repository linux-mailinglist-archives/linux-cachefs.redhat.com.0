Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5EF50719D
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Apr 2022 17:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650381869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cth3Xl9WB+JzJhqDnFYnpHArrnkSiNxqh8kAQu7DkD0=;
	b=FD2gUKnwvMxGcBRAmkpqxaNIgg1EfhuvRv8aXT75jgtW+hw+NskfJ9LNCadJ1ae1guiK5y
	Vkqlj0XjKajhCSQzb8W7DTgAKjkXXyoUXekdXIMtpmhxQ5rUAKsT1m+5zcS3eEubNaw9Yq
	r8biT3pHAZd0wM2LyW68xJid9e67Wdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-kQSCjaaBO7WegKmPJt6fUw-1; Tue, 19 Apr 2022 11:24:27 -0400
X-MC-Unique: kQSCjaaBO7WegKmPJt6fUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A7080005D;
	Tue, 19 Apr 2022 15:24:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 08356440ABA;
	Tue, 19 Apr 2022 15:24:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AAFEB1940340;
	Tue, 19 Apr 2022 15:24:23 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60D651947BBF for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 19 Apr 2022 15:24:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44765145D85F; Tue, 19 Apr 2022 15:24:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411831415125
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 15:24:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E1DA1014A64
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 15:24:22 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-3goy0_mKOZu_Y0ZUhiopow-1; Tue, 19 Apr 2022 11:24:20 -0400
X-MC-Unique: 3goy0_mKOZu_Y0ZUhiopow-1
Received: by mail-ej1-f69.google.com with SMTP id
 nc17-20020a1709071c1100b006e8aeb94fa7so6166626ejc.11
 for <linux-cachefs@redhat.com>; Tue, 19 Apr 2022 08:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cp3erbdHIxI8pbHHBBO/snHJsYK0Yd+hp7YCIMU9Eq0=;
 b=t+uVVmpYIahsZsTHxs2lrxDv71y5S7Fv/7UbIgZS39npzE60PDCHaA51Mi/9AuAuWX
 5A0tVuYKFDyZXZtE3cT1syGt8I99SNeKay5vKxucNHU63+4KrE9zwq7uKbCMnLw94RFl
 VkqnLOjGE3eY1uX3/jes/bl6f2p3sex227W5O9e/hx8OYMSRs/oC9US843RTF4IbfXR7
 qz19YmOfwS76lp6u+KQ765qjKeSNgdTGJrUqa6jZBCQWAlS6dI1kilqw55w+6Vw+nXOt
 2WwAQBaZ6DDYh5xqkauj880kw08s8rkVXbDEU+T4Jni9gbQW+FzFoCcSAZkYAK5DaUoD
 CEhw==
X-Gm-Message-State: AOAM5335Oi8/zg0DfpZXHtU0iQx/Wsqwawkg+/HVrDro0gNcey3uro6r
 OUwYrxE3f9EBZcNdjxCCl6KMVewdcQtjvg9e4b3ia9iHOSyAyB7T/IbNkLV6q1Kq6igeqdnvQyY
 9fyqywdy6gcLEe+YBeP0PGhIhzRPficaUDxDplw==
X-Received: by 2002:a17:907:8a03:b0:6ec:8197:e8ac with SMTP id
 sc3-20020a1709078a0300b006ec8197e8acmr13305417ejc.379.1650381859452; 
 Tue, 19 Apr 2022 08:24:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEV2IgUHFtehd7uHS7lnxS/tYG3PBuNMrvIeNlWN6+XHPGaya3+IKBxGf3ipbReX5cmQisNirCElxQhR5nhVo=
X-Received: by 2002:a17:907:8a03:b0:6ec:8197:e8ac with SMTP id
 sc3-20020a1709078a0300b006ec8197e8acmr13305391ejc.379.1650381859157; Tue, 19
 Apr 2022 08:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <YlWWbpW5Foynjllo@rabbit.intern.cm-ag>
 <454834.1650373340@warthog.procyon.org.uk>
 <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag>
In-Reply-To: <Yl7EyMLnqqDv63yW@rabbit.intern.cm-ag>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 19 Apr 2022 11:23:42 -0400
Message-ID: <CALF+zOnxxvDPd6L=W6N0WnS_jbYLBDfENKTousT36jQ37h_Vnw@mail.gmail.com>
To: Max Kellermann <mk@cm4all.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] fscache corruption in Linux 5.17?
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-cachefs <linux-cachefs@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 19, 2022 at 10:19 AM Max Kellermann <mk@cm4all.com> wrote:
>
> On 2022/04/19 15:02, David Howells <dhowells@redhat.com> wrote:
> > I presume you are actually using a cache?
>
> Yes, see:
>
> On 2022/04/12 17:10, Max Kellermann <max@rabbit.intern.cm-ag> wrote:
> > All web servers mount a storage via NFSv3 with fscache.
>
> At least one web server is still in this broken state right now.  So
> if you need anything from that server, tell me, and I'll get it.
>
> I will need to downgrade to 5.16 tomorrow to get rid of the corruption
> bug (I've delayed this for a week, waiting for your reply).  After
> tomorrow, I can no longer help debugging this.
>
> Max
>

FWIW, I just noticed one of my unit tests is failing with data
corruption with NFSv3 only (NFS4.x does not fail) on 5.18.0-rc3 - not
sure how repeatable it is.
I'll see what I can find out.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

