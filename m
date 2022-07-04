Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E9B564E0F
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Jul 2022 08:58:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656917928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9MA/OLerrvU+KCZUjgpejYHgUtfvel2bdhopOo7U92w=;
	b=AYjSzUnIK82zE/1r0Ye7cZeJ7QklI8foeKsVAgMXxwyqaIAw4OERZQ4T8H1Zr1Sk2DbhXh
	1tQXTr2zUWxieVCLw3SGTu2mqOlIMDxMVzu3/LW05a8MHnos2x7HhBPR3rMtfJTbhRw8wJ
	q2Z3l489N98bcr1jLz7LVyMC9QEmg1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-mwxUa9ciPM6u_FKil87WGg-1; Mon, 04 Jul 2022 02:58:47 -0400
X-MC-Unique: mwxUa9ciPM6u_FKil87WGg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C383B811E76;
	Mon,  4 Jul 2022 06:58:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFFBE9D7F;
	Mon,  4 Jul 2022 06:58:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7039E194704D;
	Mon,  4 Jul 2022 06:58:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ECB211947041 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  4 Jul 2022 06:58:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C565B40C1241; Mon,  4 Jul 2022 06:58:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C16AA40474E3
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 06:58:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8AB2101A588
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 06:58:43 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-ZfRJpSbZMi6__ARIUYJ9_Q-1; Mon, 04 Jul 2022 02:58:42 -0400
X-MC-Unique: ZfRJpSbZMi6__ARIUYJ9_Q-1
Received: by mail-pf1-f199.google.com with SMTP id
 x8-20020aa78f08000000b00525957b1610so2316282pfr.10
 for <linux-cachefs@redhat.com>; Sun, 03 Jul 2022 23:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ghxbx0CrH3dddBVyHTb8hqO8bOGREHZArBfhTAg4nok=;
 b=SrWwG8fkgEbr2tUyBf/Al05j1FtnP28z3QNm3dYP+PIixVmnGdXNQw9pqeqWQ5mumi
 YA5IHv0CdAdD0CjglEgkH8NTrWXEFw25QvvWgTvRGNe0gbNjBKdwOCtYRmwLqs8+ofIB
 rNbCE0Oe17uuyKc1XzHMOb3jzvyAyaSSFSp4Hw7mub+0yN8kP7m+kgHdkWlXM0LXzMZV
 c+l4bMqeBOnY7XgG0FOgdjq+0PWXVgQyTgXz/1vNxS1AgoUI1Q68dgB3Vtf/89V4cd8t
 S1pAngQCdcoLfs4vnLFwkgyQFzRJe99TYMhCWAi06UubTp6O2Ua9fpbb1xuUeAxeXlkT
 XLvw==
X-Gm-Message-State: AJIora8xNggRCKwNbvZ3s6g0s6nWVTuO+Y9+q96kGEYRMsYbkR02eI50
 jk+6/rCld3meIUJiFQaL7Mg+HVNcOZGXQJcNWEsDTZZD7gYp3MpLb/oS10b0e0Vdt8r1+Pz8znr
 vgER9bofUjP44vTtx7GNQ7lAY0ermCXbqOKnISHAeVKmtUiVHQ8LqtWVCxZEmuEQMvwQ8i30=
X-Received: by 2002:a17:90b:35d2:b0:1ef:3695:f1ea with SMTP id
 nb18-20020a17090b35d200b001ef3695f1eamr27947315pjb.127.1656917920870; 
 Sun, 03 Jul 2022 23:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sUsVrLQldShVE3/gxCAEU958LIEvJsghCNdNaAbMJ5v/bDAYIRm40Vl6khnOnFJy17l1K8DQ==
X-Received: by 2002:a17:90b:35d2:b0:1ef:3695:f1ea with SMTP id
 nb18-20020a17090b35d200b001ef3695f1eamr27947289pjb.127.1656917920514; 
 Sun, 03 Jul 2022 23:58:40 -0700 (PDT)
Received: from [10.72.12.186] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a17090341c700b0016be3f2cca4sm1189697ple.239.2022.07.03.23.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 23:58:39 -0700 (PDT)
To: Jeff Layton <jlayton@kernel.org>, idryomov@gmail.com, dhowells@redhat.com
References: <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
 <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
Message-ID: <c2eea9eb-e4b2-efdf-8edc-a929ac276c19@redhat.com>
Date: Mon, 4 Jul 2022 14:58:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 7/1/22 6:38 PM, Jeff Layton wrote:
> On Fri, 2022-07-01 at 10:29 +0800, xiubli@redhat.com wrote:
>> From: Xiubo Li <xiubli@redhat.com>
>>
>> The lower layer filesystem should always make sure the folio is
>> locked and do the unlock and put the folio in netfs layer.
>>
>> URL: https://tracker.ceph.com/issues/56423
>> Signed-off-by: Xiubo Li <xiubli@redhat.com>
>> ---
>>   fs/netfs/buffered_read.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
>> index 42f892c5712e..257fd37c2461 100644
>> --- a/fs/netfs/buffered_read.c
>> +++ b/fs/netfs/buffered_read.c
>> @@ -351,8 +351,11 @@ int netfs_write_begin(struct netfs_inode *ctx,
>>   		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
>>   		if (ret < 0) {
>>   			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
>> -			if (ret == -EAGAIN)
>> +			if (ret == -EAGAIN) {
>> +				folio_unlock(folio);
>> +				folio_put(folio);
>>   				goto retry;
>> +			}
>>   			goto error;
>>   		}
>>   	}
> I don't know here... I think it might be better to just expect that when
> this function returns an error that the folio has already been unlocked.
> Doing it this way will mean that you will lock and unlock the folio a
> second time for no reason.
>
> Maybe something like this instead?
>
> diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> index 42f892c5712e..8ae7b0f4c909 100644
> --- a/fs/netfs/buffered_read.c
> +++ b/fs/netfs/buffered_read.c
> @@ -353,7 +353,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
>                          trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
>                          if (ret == -EAGAIN)
>                                  goto retry;
> -                       goto error;
> +                       goto error_unlocked;
>                  }
>          }
>   
> @@ -418,6 +418,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
>   error:
>          folio_unlock(folio);
>          folio_put(folio);
> +error_unlocked:

Should we also put the folio in ceph and afs ? Won't it introduce 
something like use-after-free bug ?

Maybe we should unlock it in ceph and afs and put it in netfs layer.

-- Xiubo



>          _leave(" = %d", ret);
>          return ret;
>   }
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

