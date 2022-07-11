Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F088756D3B7
	for <lists+linux-cachefs@lfdr.de>; Mon, 11 Jul 2022 06:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657513194;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6psUdYCsCFRi1s/jqMaEfpv6SktdpY6FcTOojFZ3J3g=;
	b=Y4Y3OioKJgGTpSKAhr2k5SZl3svaxAcnA5FisZvQLHT0TOGXW2Nalw3CwRvgdPskKJSREx
	ZAwpLfwcjUlFcFffY9/kxDa0UadpvzuxM3BC79eZEZup/EjZR3kyr3fV+0DCW7q7MD/0xl
	l8SIuEoEfEEaIAS/97QSB8kQuAWBV9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-LNwvYaNXNN27PL08bMNXdg-1; Mon, 11 Jul 2022 00:19:45 -0400
X-MC-Unique: LNwvYaNXNN27PL08bMNXdg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE619811E7A;
	Mon, 11 Jul 2022 04:19:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F303C2811A;
	Mon, 11 Jul 2022 04:19:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6C0AA1947054;
	Mon, 11 Jul 2022 04:19:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2674C1947040 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 04:19:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09F93141511A; Mon, 11 Jul 2022 04:19:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05F481415118
 for <linux-cachefs@redhat.com>; Mon, 11 Jul 2022 04:19:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C928032EA
 for <linux-cachefs@redhat.com>; Mon, 11 Jul 2022 04:19:40 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-GzzYAqCPNJq1VKsNjVfUag-1; Mon, 11 Jul 2022 00:19:39 -0400
X-MC-Unique: GzzYAqCPNJq1VKsNjVfUag-1
Received: by mail-pg1-f198.google.com with SMTP id
 e5-20020a636905000000b004119d180b54so1341823pgc.14
 for <linux-cachefs@redhat.com>; Sun, 10 Jul 2022 21:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iYSp6HlI0dDBIV/HDsecc6eKbJCd3YWkca9HdFglgEg=;
 b=GR/BHfyYwiToNkrEIlJOw6Tp3P+Jlj2w8FVufk0N3aNyXA366AXBtdcfyEOvZZ6Av6
 Ms9i6IAmDw/u4oyPpyS5lgO1W/UGyvNcDoPS5DMY8zv0JD5W52eOw/W/Glf3kRhY6P6F
 IlRQHaB5xb2mwmGBi6rxKJ1D0VCFs8//KZkwVbpTPHPlbtPPtmz9DeGfZzS28L+X1TWu
 2GbzzmEJdTg300zyLo+nKBYtNlsrE8YVQShAlt6YJ9XvCH+RQ18QPrDkMKanvNbGnMT8
 8rmxSG3NUXNgBq0royElb9S+vjyoDfetFWOU2zT1bMJYJvvBlpkVFRqkmF89Z4XzNxWQ
 P1QQ==
X-Gm-Message-State: AJIora/8NXD8/k7mQTmNEf7DQbjdFBt981hL6Kj26X1ZhRzPU3ApeOWT
 cH1UDcNepWjZ+kMMIKh4azootUzb3ghQ2uPprCR2WnJdyRA9o+7n3oQ84BCdQHq+7r63Uso3JRK
 8Q2siUm5HcFdFSULng+KPvw==
X-Received: by 2002:a63:2c47:0:b0:411:54ab:97b6 with SMTP id
 s68-20020a632c47000000b0041154ab97b6mr14206425pgs.173.1657513178581; 
 Sun, 10 Jul 2022 21:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sdLoGKlY/5zCNt7vw/gv0lyzTZM8Mh6bsyCtyMbXMA0uNpORIFIeDfE5UALrqX7MSFep4+Rw==
X-Received: by 2002:a63:2c47:0:b0:411:54ab:97b6 with SMTP id
 s68-20020a632c47000000b0041154ab97b6mr14206416pgs.173.1657513178370; 
 Sun, 10 Jul 2022 21:19:38 -0700 (PDT)
Received: from [10.72.14.22] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902f54700b0016be4d310b2sm3543056plf.80.2022.07.10.21.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 21:19:37 -0700 (PDT)
To: Matthew Wilcox <willy@infradead.org>, David Howells <dhowells@redhat.com>
References: <20220707045112.10177-1-xiubli@redhat.com>
 <2520851.1657200105@warthog.procyon.org.uk>
 <YsbfCcNvjMVcT2yx@casper.infradead.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <cf169f43-8ee7-8697-25da-0204d1b4343e@redhat.com>
Date: Mon, 11 Jul 2022 12:19:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YsbfCcNvjMVcT2yx@casper.infradead.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 7/7/22 9:26 PM, Matthew Wilcox wrote:
> On Thu, Jul 07, 2022 at 02:21:45PM +0100, David Howells wrote:
>> -					 struct folio *folio, void **_fsdata);
>> +					 struct folio **_folio, void **_fsdata);
> The usual convention is that _foo means "Don't touch".  This should
> probably be named "foliop" (ie pointer to a thing that would normally
> be called folio).
>
This looks good to me.

I will send out the V5 by fixing this and will merge this patch via the 
ceph tree as discussed with David in the IRC and will cc the stable at 
the same time.

Thanks!

-- Xiubo



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

