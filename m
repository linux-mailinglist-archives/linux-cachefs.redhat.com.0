Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 938544CA69D
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Mar 2022 14:52:06 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-NhWRoNNmM9OkLwy5NIuSeg-1; Wed, 02 Mar 2022 08:52:02 -0500
X-MC-Unique: NhWRoNNmM9OkLwy5NIuSeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F37B651DC;
	Wed,  2 Mar 2022 13:51:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DCE79900;
	Wed,  2 Mar 2022 13:51:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19DBA4A701;
	Wed,  2 Mar 2022 13:51:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 222Dpplk017159 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Mar 2022 08:51:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0240D400E10C; Wed,  2 Mar 2022 13:51:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F16F14010A1D
	for <linux-cachefs@redhat.com>; Wed,  2 Mar 2022 13:51:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F91800882
	for <linux-cachefs@redhat.com>; Wed,  2 Mar 2022 13:51:50 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
	[209.85.217.41]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-240-gczdWjqQNNGgxYRH7J72dw-1; Wed, 02 Mar 2022 08:51:49 -0500
X-MC-Unique: gczdWjqQNNGgxYRH7J72dw-1
Received: by mail-vs1-f41.google.com with SMTP id d11so1918309vsm.5;
	Wed, 02 Mar 2022 05:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EKpPgbkkKlzEsFTDu9xIc0ZsMrY5wembgqXpNtT/fXQ=;
	b=2TswD9pEExV4irxq7lLjZ+pLXnM/SY28+gUa/W5PhQ6FUWIEs5lqyS2USNFN4oGRYE
	lgiyDZfYpBZrxQb+2h/vPEclH/sfmk6QTgsBuxAp5fbK57XwpJNsf6d7L9MV+KMSY0yo
	WV5lZQVQVsoVe6gu14U57ibbC2oHb5k5Io6oHJOVxN3oNGwUaARmvwY+EY5QmNyz46Jc
	p9/3CKU5Ea1Bfd8j8X/ULLByh5NCMQNeb9WgM1S9yzg9gZsGf4JAOCFz6IEFIu8gXhPI
	3NmE+4QqYeTnEUewQeKdjirSR1wtO2XHUOagXXdupOz23iwyo/ITxn6B/RdoZQ3Se1O8
	AG4w==
X-Gm-Message-State: AOAM530DdD18zoHWh+vk0VKF8o88tPmsP2DLUM544bt3UX8OiDSE19kG
	yqeWagbyn1t1tVeoU7t//DL8v0zVyXiccBbqNqJviqywtpA=
X-Google-Smtp-Source: ABdhPJwOVr3O03Y7i9OQq6aznHLPtjaPn4ggsCkcfGzfdPfaBRjUJdCOJkwfhrSYRTC46LGZnY9f9tXmquk8MhjSmOY=
X-Received: by 2002:a05:6102:418a:b0:31a:1d33:6803 with SMTP id
	cd10-20020a056102418a00b0031a1d336803mr12887269vsb.40.1646229108160;
	Wed, 02 Mar 2022 05:51:48 -0800 (PST)
MIME-Version: 1.0
References: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
	<CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<3013921.1644856403@warthog.procyon.org.uk>
	<CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
	<2498968.1646058507@warthog.procyon.org.uk>
	<CACdtm0aZnQLyduKxr9dhcpYB_r00UFnR=WQvAnqL0DebxgbrOw@mail.gmail.com>
	<2568725.1646127551@warthog.procyon.org.uk>
In-Reply-To: <2568725.1646127551@warthog.procyon.org.uk>
From: Rohith Surabattula <rohiths.msft@gmail.com>
Date: Wed, 2 Mar 2022 19:21:37 +0530
Message-ID: <CACdtm0Yf3ifEeMeAeyDRvofk40GZjZRqF7FCP2Uu6bm+i5RM3g@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No, I don't have any private changes on top of your cifs-experimental branch.

Below is last commit:
commit cf302ba2d441582a060a0ea1aa4af47f09b24f57 (HEAD ->
cifs-experimental, origin/cifs-experimental)
Author: David Howells <dhowells@redhat.com>
Date:   Tue Nov 17 15:56:59 2020 +0000

    cifs: Use netfslib to handle reads

yes, I have used "Vi". I have tried with md5sum as well.

Regards,
Rohith

On Tue, Mar 1, 2022 at 3:09 PM David Howells <dhowells@redhat.com> wrote:
>
> Btw, do you have any changes on top of my cifs-experimental branch?
>
> Also, what commands are you running to test it?  I see you're using 'vi' - is
> it possible that vi is opening the file O_RDWR?
>
> David
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

