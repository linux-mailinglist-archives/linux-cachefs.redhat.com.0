Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BFE633682
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Nov 2022 09:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669104052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0OKMTn7CdsDE2dzqfwmnRKH0XgiW+yNcnpeZtmqzToA=;
	b=V0yGHh4gWfkgq7j6i4F7tXHy5tqZ91bqaYvS3tfDSbXpyBnGLGL8o06HRcJ23pFbq8s/hT
	o3kj+U1EcIaai1svmAyBPVo3AP/FEd9O9biNzDYHM/SReNyphzrv6uk1dY1HyJklOBy5kz
	m1v4USqImm9bHTy/RwGTKdF+OMPK6rQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-6IW3OjpWNcSGIk0aYAuKNQ-1; Tue, 22 Nov 2022 03:00:46 -0500
X-MC-Unique: 6IW3OjpWNcSGIk0aYAuKNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 114D3802D32;
	Tue, 22 Nov 2022 08:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4346B492B17;
	Tue, 22 Nov 2022 08:00:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5C1B194658C;
	Tue, 22 Nov 2022 08:00:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8A9BC1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 08:00:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D3691402BDA; Tue, 22 Nov 2022 08:00:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6546A1402BD9
 for <linux-cachefs@redhat.com>; Tue, 22 Nov 2022 08:00:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DC663C0E452
 for <linux-cachefs@redhat.com>; Tue, 22 Nov 2022 08:00:41 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-wYnHu5UQM5iT4DGAG_S5LA-1; Tue, 22 Nov 2022 03:00:39 -0500
X-MC-Unique: wYnHu5UQM5iT4DGAG_S5LA-1
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-39ce6773248so66665807b3.12
 for <linux-cachefs@redhat.com>; Tue, 22 Nov 2022 00:00:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h59ryiMCs2FQd65ugpgIMTexsvSUB1uVySh9oB0AU10=;
 b=PgjAj0L7OJmzDxQU8BslxAADNRfTvubbC8LEDILIPb5AYx0HhyROj+aEPTWumlnZMC
 Tnax2NbZPvQIqBzra6BuGRzvUIEpLKEqLzMjlCJnCaDV4VSjJ1ty2RUerb2bzTbYNEC4
 H38eZAK1sKu7TAQcv8hMtIGGBGpl8X6oVxbchAso7HI++/xMl4pirzHexbipgsYklbpN
 uA5O2aM5tTzuXeJOw3qFcw6Nvvke4nxtT1J136r6u7mOK8hO5FSG2DdBwRpSjWM67hfp
 TIrhmQtkkQlq/xn4ldik0PiisXXyIR6LXAQF1uh569zYah7cVTfgrfl77brxo0MPAmvN
 nsmA==
X-Gm-Message-State: ANoB5pnwFYuVI/MhPKo/jKKsfPHQrWbo+JP7f9I0qHy8QtT5PEcEu3Fd
 8Ka7E6U7Lp9mQMcJEgL5jd3jcpXXsUXa70ENNeXPWg==
X-Google-Smtp-Source: AA0mqf6QSzMEX47WR/XlJoVErLNYz3JHOGM1wbuw70Vp/FxDr1jJqCMLJUizS1H/I9EdwKfsgcQWqQIZxatNfxddF58=
X-Received: by 2002:a81:af27:0:b0:36b:efc9:fb13 with SMTP id
 n39-20020a81af27000000b0036befc9fb13mr4636144ywh.324.1669104038897; Tue, 22
 Nov 2022 00:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20221117115023.1350181-1-dwysocha@redhat.com>
In-Reply-To: <20221117115023.1350181-1-dwysocha@redhat.com>
From: Daire Byrne <daire@dneg.com>
Date: Tue, 22 Nov 2022 08:00:02 +0000
Message-ID: <CAPt2mGOaLQh2v-Bk8rLni3jXx+rwy9uNOudg+kc-P2pWEJ6QbA@mail.gmail.com>
To: Dave Wysochanski <dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH 0/1] Fix oops in
 cachefiles_prepare_write due to cookie_lru and use_cookie race
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
 Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 17 Nov 2022 at 11:52, Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> This patch should fix the oops seen by Daire while testing the latest
> NFS netfs fscache conversion patches [1][2].  What follows is a detailed
> explanation of the analysis, mostly for reference and in case any of
> the patch header is unclear.

I can now confirm that this does indeed fix the issue I was hitting -
it has been over 4 days and I have not seen the crash that I was
reliably reproducing at least once a day.

Many thanks for tracking this down Dave.

I will try to switch over to the v2 patch sometime this week but I
don't expect a change in functionality. The important thing is you
found the place where it was going wrong and why.

Tested-by: Daire Byrne <daire@dneg.com>

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

