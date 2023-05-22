Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 780F470B73F
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 May 2023 10:03:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684742608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CBD45z94LLB746wX1NG0m3EHhO0h0XKNBDL6w5jObow=;
	b=RcnJ/FOEv1ZoDkB2ID1F8P8GdASQYMBZPqNN4MQiLsGb4iouiT6vkil87aZkMmcZKhCHxN
	YzpPwjacamWdydd9nN66g8V08QzNTp2jyrdCnmA+BI1orszfnoTnoG8qSxw6XbebvdVB6e
	PbW9yl1XpQJqv4DtpgnzY0uu41aEl8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-gS0nYnrPPXSedNPZCFAxZA-1; Mon, 22 May 2023 04:03:25 -0400
X-MC-Unique: gS0nYnrPPXSedNPZCFAxZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BA56811E88;
	Mon, 22 May 2023 08:03:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90A8BC54184;
	Mon, 22 May 2023 08:03:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0ABCE19465A8;
	Mon, 22 May 2023 08:03:21 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CC3B8194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 22 May 2023 07:48:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD59CC54186; Mon, 22 May 2023 07:48:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B61F4C54184
 for <linux-cachefs@redhat.com>; Mon, 22 May 2023 07:48:38 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99D551C02D2D
 for <linux-cachefs@redhat.com>; Mon, 22 May 2023 07:48:38 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-nM--anZjNzST29e_MlKDSA-1; Mon, 22 May 2023 03:48:36 -0400
X-MC-Unique: nM--anZjNzST29e_MlKDSA-1
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f605d8a8a9so4652385e9.0
 for <linux-cachefs@redhat.com>; Mon, 22 May 2023 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684741715; x=1687333715;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Kb4cOaN3U6qUdJgq/Za99UmZrFOOArtlfNKX4o+hKU=;
 b=kTtPnabP2xluX95V7Uhq/+os/hD4edQCEcdotIEABRZiVGmpNVsKuDLo1uMNJ7zmfA
 uIm9YNtm+SOtBWRswdijAHSCptcBE/ix4pKpbK6BrELkUvY3kbzG4UH5o6JTMpG2oYVr
 Bm7HlqAXdFDZF9p1HrWEUpuM6JDqisNxAlf0jUDbmG4nKZS3VIHH39UUuEHdKRk96FKN
 j0I5dLzUK4y5fRZIG9UTKFo+2OVecBOUeQRpsaeWo5nW9ZaUMEP9ygBUYDayYpzms0fh
 5wqaheLC2nos0dNtaL/qMTqnUSb7MKOR0bm+4is1m0rJnNBlWbkrJ2ARp30CqKYZ3PZE
 X1QQ==
X-Gm-Message-State: AC+VfDx1B7KmgZscCq+xe3t7Ga/pxNMubIXkM5W8Pizl+KydGB4DIKEj
 gawPwIF9SB1b7WEefVockB2mzmlzOk1a2djnxyE=
X-Google-Smtp-Source: ACHHUZ7AoHV2BoPNcFpjbcgvgaft8EqE4sGboZYeRhHRoHFCjNx7PWc7XkVnq/qBvQjOp446MSkVbQ==
X-Received: by 2002:a05:600c:cf:b0:3f4:2572:2259 with SMTP id
 u15-20020a05600c00cf00b003f425722259mr6628605wmm.28.1684741715206; 
 Mon, 22 May 2023 00:48:35 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1c7914000000b003f607875e5csm631670wme.24.2023.05.22.00.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 00:48:33 -0700 (PDT)
Date: Mon, 22 May 2023 10:48:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dhowells@redhat.com
Message-ID: <a0f8e4cf-911c-4d81-b3be-9cbafef4fc29@kili.mountain>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 22 May 2023 08:03:19 +0000
Subject: [Linux-cachefs] [bug report] fscache: Implement cache registration
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linaro.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello David Howells,

This is a semi-automatic email about new static checker warnings.

The patch 9549332df4ed: "fscache: Implement cache registration" from 
Oct 20, 2021, leads to the following Smatch complaint:

    fs/fscache/cache.c:186 fscache_put_cache()
    warn: variable dereferenced before IS_ERR check 'cache' (see line 182)

fs/fscache/cache.c
   181	{
   182		unsigned int debug_id = cache->debug_id;
                                        ^^^^^^^^^^^^^^^
Dereferenced

   183		bool zero;
   184		int ref;
   185	
   186		if (IS_ERR_OR_NULL(cache))
                                   ^^^^^
Checked too late.

   187			return;
   188	

regards,
dan carpenter

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

