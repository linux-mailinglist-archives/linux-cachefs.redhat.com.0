Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMHQUO2QMGQECQ4ZYZQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B813941450
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jul 2024 16:26:58 +0200 (CEST)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-45007d21bd9sf49586531cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Jul 2024 07:26:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722349617; cv=pass;
        d=google.com; s=arc-20160816;
        b=IqW2RaNw5uDaVHdfmF7tq05WTt2LVYtm9mtJlC27VRUp1OuM81mg0hqv8IT9gFqVin
         xUwa6zX+ZmwSYbNzrsarLmXiZetgBFDv3JHgL6pByWzMjVriVzZlKGNNR0QU6YNDJt9/
         I3Gi2wVWov1rIsqLQiY3T3xX28Y1R7WFCzUVET6Tv9WvPyht4gLL6Wp9qJjBxlVZUMyZ
         QdmnJNooGfG0NZhs12Y5AOpvyQAc5KRqR3xotssO+cAiP4saTcETfuEH0ECbp0xsljtj
         Zgmhw+E47Q8REnh44RlYsjkX+CjH/TJ8OprfHkM1FmVaHC2rytax00yJD+o3qpXgf3Ep
         IFaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=tHz2oGoZK/WBG7sYf4rdg/j8NoVp1M4za9+XxEn716U=;
        fh=HRmZDFt6e6dW++wpiX/Bacj2jvTl2NOLakzW1MKPXoM=;
        b=0mZqyI0Ch/Cm24eGTWBP8Hr/5wKeUcGR4LP6DrVeCndfpnn9lMnmUPJaAu9c1geB34
         XFTiCus0pEQjKAIjqPi2tID7etnkBvfgRpzqq8Btd/OSuTlYK5MVzZl3yQDtvQC0YKfP
         Sb0OxUizw1bXblHpONfX62PYG9RqmqgrqiQujeXMfKo/RQPOgZGfij026k2j3nu7QJlN
         UdKcJlT2iJ1b20uichYPPD0Xv4d7kUYkAOOdvirqqwBpEZuB0/+7cf7HMQXj1YzRYk4z
         lXFpdmldlHEL/dFsGxuL+ByGVqEPXUL09vZUKkZXBmi0g7tZ0S8F2iapWoAmRJVLO7I6
         +NpA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722349617; x=1722954417;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHz2oGoZK/WBG7sYf4rdg/j8NoVp1M4za9+XxEn716U=;
        b=T/qlbdPAq1tHMEK8Wm4Qxn+Rpbbb+s8xGYwXaajL0qYRrjM5TgvxTJrSEQeFY50uxB
         u4a0efZ0u79yAi8chX/pgXW7ig5MjnoUfals0iwv38m+mp3ah2jkBwzzVd4PbiLghKKl
         WQzEqa0mDeJvHhWCdVpsNUyzJnPRP5vvF6f7LxfEgQ9TaBFzF9elh+jOJqwAw682ZQXr
         emZrsMBtPJpOeFxYHPYvKFHPr3PCwcr7awlAxkTXJMgAckRuZnJ34Brl/20tixZpR7pE
         ur4Cd/h7CUElLYCU+EU8wIC8wMYGtjYa3GuNh/XeNr+BcuM6fzmkeXwiTY1CeK4nRi7e
         QxUA==
X-Forwarded-Encrypted: i=2; AJvYcCWbGNwA+yGML8v4g5fUacLeVm/jJPDyZQOd7/6hIJgpNPvOBptxkpJ6Kzvy35hTXpsD82Whyr/ErgV9JNKJji7brBNP4t2sjRbb3zw=
X-Gm-Message-State: AOJu0YzgOE9kvBvECvn4KF1hfVj8qTWxINVrDQZWDObvyzgto4aI4qnm
	iu+46mBweD5/48K/GcihaWtX9SMOsuESUM6gOcbw/SVLF28Pbmv7qp+11fmvhlI=
X-Google-Smtp-Source: AGHT+IGAZPYxgWabuGnLHLLOpkS7hCAsf0j8cOPdjKy/F1VUPd590kSsFQo0zQRcxhnzB0Y3UugShA==
X-Received: by 2002:a05:622a:11c8:b0:447:f6bb:6f80 with SMTP id d75a77b69052e-45004ab516bmr160902681cf.0.1722349617198;
        Tue, 30 Jul 2024 07:26:57 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a13:b0:441:5568:9dea with SMTP id
 d75a77b69052e-44fe325fd62ls107264481cf.2.-pod-prod-06-us; Tue, 30 Jul 2024
 07:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2HpP85ZNd+QNOuG8Sc0KeJDXHL5hXyt+emGRziIWk7hIIsnTvuJb55A0qdNgyJUdKoc7qK3r0D1CAz6KxtQxRoDdfz4kezixQwOfi8uA=
X-Received: by 2002:ac8:7f07:0:b0:446:596c:3277 with SMTP id d75a77b69052e-45004ddc42cmr142284211cf.16.1722349616257;
        Tue, 30 Jul 2024 07:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722349616; cv=none;
        d=google.com; s=arc-20160816;
        b=nTsJ1ILlR2CNjE23fhVzxM4utKb6IAZFT0BSnuWHOaycsbSMID8sekmFcxeGvWmZ/m
         X9HOOmPwl3dUhZr9GKlJi0Ak6N1OdQ3oKvBJ6UqwnIRc3m+ptNfoLDYFYOeOWk+WO/I5
         oHpuRFdr5lN08lFGRRyJqTflr7Sp7nJg5XGhKaEadGsHmEajiU/t8apvk8VxmKWxwX5F
         6dySin1ctpP+Ywq76VKxs+3WFC+j2/3rh4ULfnktYnxtlwCdrAzUQLFgx1Z/W5YcD8Dv
         Pdjp0fgsZfvI9DgCTTCxBm01K3fvwHdYX1EpM4diIqxsFhafuXKKOd+YP38n0p7YPjjq
         NEjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=HN99UYk8Kh6g/3OE9am3X/kGbGNdhXjLG7Bh6vntP4U=;
        fh=4o1FoawZ3FEDm3jfBtv8yJo5tNsD5YW7NfYuUjYO4HE=;
        b=eC5ioAuMj32mixcvNVyh3GB6dHlxC+JSlnCaAhmPlMfKe5kzRSHmjiZiRzF7cjDHe/
         oDKn5f5njVNzXuJjxBMmc3bYcOWpvM0qM4oHrigor3oQpXMOLuLckcpWz8KyDgr2KvoE
         2w1AbJCaHsGTeastv68WQAALtGmDtjLErpvFUihV7n0Y4y5hipsDOD+iXOwiFwApoK5a
         lRaBfpY8rSbierRFuOP1QIe+sSzFvbWB5/SElkW7Xh9Bf/xt4lGtb8EA80Ys/qWNBzoN
         ypqSjqRjDMy5pWMhwN0ZwVv8l1CzF7EfdISuuapiPBZ3QzxnVSGO22HOEK0vES3CC+hB
         c6Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8422887si125833781cf.572.2024.07.30.07.26.56
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-401-BS6vHZg2N5GC-eWmDjJTfA-1; Tue,
 30 Jul 2024 10:26:54 -0400
X-MC-Unique: BS6vHZg2N5GC-eWmDjJTfA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 960CE1955BF4
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Jul 2024 14:26:53 +0000 (UTC)
Received: by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 869F719560AA; Tue, 30 Jul 2024 14:26:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4ECC1955D42;
	Tue, 30 Jul 2024 14:26:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240729090639.852732-1-max.kellermann@ionos.com>
References: <20240729090639.852732-1-max.kellermann@ionos.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: dhowells@redhat.com, jlayton@kernel.org, willy@infradead.org,
    linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
    ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
    stable@vger.kernel.org
Subject: Re: [PATCH] fs/ceph/addr: pass using_pgpriv2=false to fscache_write_to_cache()
MIME-Version: 1.0
Date: Tue, 30 Jul 2024 15:26:49 +0100
Message-ID: <3516608.1722349609@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3516607.1722349609.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

For the moment, ceph has to continue using PG_private_2.  It doesn't use
netfs_writepages().  I have mostly complete patches to fix that, but they got
popped onto the back burner for a bit.

I've finally managed to get cephfs set up and can now reproduce the hang
you're seeing.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

