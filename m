Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E462DDA1
	for <lists+linux-cachefs@lfdr.de>; Thu, 17 Nov 2022 15:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668694301;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lvYUpO83KtVbyndoSoLBCe+MnjlSUFNEvFuAFos2FvE=;
	b=RtV+e6uLAC0TsxR4xs6FzcwFgF8yGvHfFMZHSKCjnts7EJfLOGkJuWM9ctENui9pW5YoJk
	YTxkV0cV4h538p9JFqIlu0Mk6Bq7451Yoe01UQWHHfsNxuMrL3pbzi+YIGnw9Y116d5v+w
	tOeyaY44rR8dFxeUx2zZUtNQQd3V2aY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-uPEI1UVcNQuE24_h_9GQ0w-1; Thu, 17 Nov 2022 09:11:38 -0500
X-MC-Unique: uPEI1UVcNQuE24_h_9GQ0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 923EA8582B9;
	Thu, 17 Nov 2022 14:11:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7903E39D6A;
	Thu, 17 Nov 2022 14:11:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4151119465A4;
	Thu, 17 Nov 2022 14:11:37 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B51731946595 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 17 Nov 2022 14:11:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69637492B0C; Thu, 17 Nov 2022 14:11:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 626AF492B04
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 14:11:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47B1E811E87
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 14:11:36 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-uKpLX4iwN5aeXMUcOSEJYA-1; Thu, 17 Nov 2022 09:11:34 -0500
X-MC-Unique: uKpLX4iwN5aeXMUcOSEJYA-1
Received: by mail-pl1-f199.google.com with SMTP id
 o7-20020a170902d4c700b001868cdac9adso1476765plg.13
 for <linux-cachefs@redhat.com>; Thu, 17 Nov 2022 06:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wpo0rn1pBCjCV4bU+0IiTD80Tf+UEqnfeMIwfEX23AY=;
 b=H+MtLdEWfq5k87JboJjT3YBed9mC15GL3IbzTdAfmCvVRftPOAtOvKbW9NUS1GaQ1q
 oxK+aYopUxja1gjOls25an17waibaL1aaTUMl/N36rYstb6ZzvY4UX2lIZrfqFh8OwP8
 qeS0Zg/VqWibjjpjboHgeRl1giJIl5N5VE/+YI3/wehmIu5FeYJ26aoAuML1w2HT5Qz5
 Lds4Gw8dJHXA04ibl/1c589hsWAEWyxNHEughwvehgTwHrhYfD2t96JarY8YawVx/PXg
 5NQsObmFivT8kwhhS579EcZVMLQh/F4vFA1R640YLHE8UBp9we+SwnN/zuUsYgI7wW4h
 lDfg==
X-Gm-Message-State: ANoB5plf5h0/HA5jRtIy+WmuDs8I5Jst47wAF+lmKsPdq+MNpI4alKpe
 0J0HGKzXUW3mhFhmReQH/pWwySclAzlzCWcQje2VIuoJQQ89Jv4VTNLEtgLZvB8wdOqcJ9F4oSx
 +gaBUXmXMC03BHtpTszfkgbq0ONFwIzdw9Ytaow==
X-Received: by 2002:a17:903:2448:b0:188:f5c7:4d23 with SMTP id
 l8-20020a170903244800b00188f5c74d23mr1251324pls.125.1668694293612; 
 Thu, 17 Nov 2022 06:11:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7/ptWMpGaatE6yG6Y+YKNblVlzyCypiHU9BbCa7bA6jTELsiAgZ0A87A2SAAlaZv4B4d6D7zmTD9hbRM9jYwc=
X-Received: by 2002:a17:903:2448:b0:188:f5c7:4d23 with SMTP id
 l8-20020a170903244800b00188f5c74d23mr1251307pls.125.1668694293360; Thu, 17
 Nov 2022 06:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20221117115023.1350181-1-dwysocha@redhat.com>
 <20221117115023.1350181-2-dwysocha@redhat.com>
 <3716830.1668693167@warthog.procyon.org.uk>
In-Reply-To: <3716830.1668693167@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 17 Nov 2022 09:10:57 -0500
Message-ID: <CALF+zOme4qF1y5ZLuhNO8Cahn-YCDnNCRQ4WN75C9cp69B6KPA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 1/1] fscache: Fix oops due to race with
 cookie_lru and use_cookie
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 17, 2022 at 8:52 AM David Howells <dhowells@redhat.com> wrote:
>
> Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> > +             clear_bit(FSCACHE_COOKIE_DO_LRU_DISCARD, &cookie->flags);
>
> Actually, can you do test_and_clear_bit() and then log a trace point, say:
>
>         fscache_see_cookie(cookie, fscache_cookie_see_lru_discard_cancel);
>
> if the bit was set.
>
> David
>

Ok sure.  I will post a v2 with the trace point and the test_and_clear_bit.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

